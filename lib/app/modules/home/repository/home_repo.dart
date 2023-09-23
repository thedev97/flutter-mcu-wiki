import '../../../core/remote_url.dart';
import '../../../data/model/mcu_model.dart';
import '../../../data/network/network_api_response.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<McuModel> mcuFilmList() async{
    var response = await _apiServices.getApi(marvelApiUrl);
    return McuModel.fromJson(response);
  }
}