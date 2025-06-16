import 'package:fish_tank/db_fish/db_fish.dart';
import 'package:get/get.dart';

import '../../db_fish/fish_entity.dart';

class FishFirstLogic extends GetxController {

  DBFish dbFish = Get.find();

  var list = <FishTankEntity>[].obs;

  void getData() async {
    list.value = await dbFish.getFishAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
