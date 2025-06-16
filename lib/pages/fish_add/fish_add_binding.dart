import 'package:get/get.dart';

import 'fish_add_logic.dart';

class FishAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FishAddLogic());
  }
}
