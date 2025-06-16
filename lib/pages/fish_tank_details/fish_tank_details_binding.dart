import 'package:get/get.dart';

import 'fish_tank_details_logic.dart';

class FishTankDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FishTankDetailsLogic());
  }
}
