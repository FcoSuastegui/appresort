import 'package:appresort/app/data/models/tickets_model.dart';
import 'package:appresort/app/data/services/ticket_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TicketController extends GetxController {
  TicketController._internal();
  static TicketController _instance = TicketController._internal();
  static TicketController get instance => _instance;

  static const _pageSize = 10;

  final user = GetStorages.i.user;

  final pagingController = PagingController<int, TicketsModel>(
    firstPageKey: 1,
  );

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getTickets(pageKey);
    });
    super.onInit();
  }

  RxList<TicketsModel> _tickets = List<TicketsModel>().obs;
  RxList<TicketsModel> get tickets => _tickets;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  RxList<String> _catalogoItems = List<String>().obs;
  // ignore: invalid_use_of_protected_member
  List<String> get catalogoItems => _catalogoItems.value;

  List<CatalogoTicketModel> _catalogoTicket = List<CatalogoTicketModel>();
  CatalogoTicketModel catalogoSeleccionado;

  File _image;
  File get image => _image;

  ImagePicker _picker = ImagePicker();

  Future<void> getTickets(int pageKey) async {
    final list = await TicketService.tickets(
      idpropietario: int.parse(user.idpropietario),
      sistema: int.parse(user.sistema),
      page: pageKey,
    );

    if (list.message == null) {
      final isLastPage = list.itemList.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(list.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(list.itemList, nextPageKey);
      }
    } else {
      pagingController.error = list.message;
    }
  }

  Future<void> obtenerCatalogoTicket() async {
    final response = await TicketService.catalogoTicket(
      idpropietario: int.parse(user.idpropietario),
      sistema: int.parse(user.sistema),
    );

    _catalogoItems.clear();
    _catalogoTicket = [];
    if (response.status) {
      response.data.forEach((item) {
        _catalogoItems.add(item['nombre']);
        _catalogoTicket.add(CatalogoTicketModel.fromJson(item));
      });
    }
  }

  void seleccionarCatalogo(String catalogo) {
    catalogoSeleccionado = _catalogoTicket.firstWhere(
      (e) => e.texto == catalogo,
    );
  }

  Future<void> openGallery() async {
    final picture = await _picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 640,
    );
    _image = picture != null ? File(picture.path) : null;
    if (picture != null) Get.back();
    update(['image']);
  }

  Future<void> openCamara() async {
    final picture = await _picker.getImage(
      source: ImageSource.camera,
      maxHeight: 500,
      maxWidth: 640,
    );
    _image = picture != null ? File(picture.path) : null;
    if (picture != null) Get.back();
    update(['image']);
  }

  void deleteImage() {
    _image = null;
    update(['image']);
  }
}
