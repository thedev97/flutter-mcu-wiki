import 'package:get/get.dart';
import '../controllers/details_controllers.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
          () => DetailsController(),
    );
  }
}
