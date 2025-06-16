import 'package:get/get.dart';

import 'fish_edit_logic.dart';

class FishEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
