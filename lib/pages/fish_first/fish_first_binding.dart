import 'package:get/get.dart';

import 'fish_first_logic.dart';

class FishFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FishFirstLogic());
  }
}
