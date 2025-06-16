import 'package:fish_tank/pages/fish_first/fish_first_logic.dart';
import 'package:fish_tank/pages/fish_second/fish_second_logic.dart';
import 'package:get/get.dart';

import 'fish_tab_logic.dart';

class FishTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FishTabLogic());
    Get.lazyPut(() => FishFirstLogic());
    Get.lazyPut(() => FishSecondLogic());
  }
}
