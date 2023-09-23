import 'package:get/get.dart';
import '../repository/home_repo.dart';
import '../../../data/model/mcu_model.dart';
import '../../../data/response/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final mcuFilmList = McuModel().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setMcuFilmList(McuModel _value) => mcuFilmList.value = _value;

  @override
  void onInit() {
    super.onInit();
    mcuFilmApi();
  }

  // Get MCU Film List
  void mcuFilmApi() {
    _api.mcuFilmList().then((value) {
      setRxRequestStatus(Status.SUCCESS);
      setMcuFilmList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.FAILED);
    });
  }
}
