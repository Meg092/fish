import 'package:get/get.dart';

import 'fish_second_logic.dart';

class FishSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FishSecondLogic());
  }
}
