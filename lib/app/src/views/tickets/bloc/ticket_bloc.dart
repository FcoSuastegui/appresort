import 'package:appresort/app/src/data/services/ticket_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/helpers/validators_bloc.dart';
import 'package:appresort/app/src/views/tickets/controller/ticket_controller.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';

class TicketBloc extends FormBloc<String, String> {
  final descripcion = TextFieldBloc(validators: [ValidatorsBloc.required]);
  final TicketController controller = Get.find<TicketController>();

  TicketBloc() {
    addFieldBlocs(fieldBlocs: [
      descripcion,
    ]);
  }

  @override
  Future<void> close() {
    descripcion?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    if (controller.catalogoSeleccionado == null) {
      emitFailure(failureResponse: "Selecciona algun tipo de servicio");
    } else {
      final response = await TicketService.inst.addTicket({
        'id_cat_ticket': controller.catalogoSeleccionado.id,
        'mensaje': descripcion.value,
        'idpropietario': GetStorages.inst.idpropietario,
        "image": controller.image != null
            ? await MultipartFile.fromFile(controller.image.path,
                filename: path.basename(controller.image.path))
            : ''
      });

      response.status
          ? emitSuccess(successResponse: response.message)
          : emitFailure(failureResponse: response.message);
    }
  }
}
