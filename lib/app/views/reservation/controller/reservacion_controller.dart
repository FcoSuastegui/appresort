import 'package:appresort/app/data/models/meeting_model.dart';
import 'package:appresort/app/data/services/areas.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';

class ReservacionController extends GetxController {
  RxList<MeetingModel> metting = List<MeetingModel>().obs;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    getDataSource();
    super.onInit();
  }

  Future<void> getDataSource() async {
    _loading(true);
    final response = await Areas.reservaciones(
      int.parse(GetStorages.i.user.idpropietario),
    );

    if (response.status) {
      metting.clear();
      final list = response.data.map((e) {
        final date = e['date'].split('-');
        final DateTime startTime = DateTime(
          int.parse(date[0]),
          int.parse(date[1]),
          int.parse(date[2]),
          e['from'] as int,
          0,
          0,
        );

        final diff = e['to'] - e['from'];

        print(diff);

        final DateTime endTime = startTime.add(Duration(hours: diff as int));
        e['from'] = startTime;
        e['to'] = endTime;
        return MeetingModel.fromJson(e);
      }).toList();

      list.forEach((e) => metting.add(e));
    }

    _loading(false);
  }
}
