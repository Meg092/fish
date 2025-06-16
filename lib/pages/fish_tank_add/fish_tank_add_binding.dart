import 'package:get/get.dart';

import 'fish_tank_add_logic.dart';

class FishTankAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FishTankAddLogic());
  }
}
