import 'dart:typed_data';

import 'package:fish_tank/db_fish/db_fish.dart';
import 'package:fish_tank/db_fish/fish_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FishTankAddLogic extends GetxController {

  DBFish dbFish = Get.find();

  Uint8List? image;

  int type = 0;

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(imageQuality: 90,maxWidth: 1024,source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void addData() async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select image');
      return;
    }
    await dbFish.insertFishTank(FishTankEntity(id: 0, createdTime: DateTime.now(), image: image!, type: type, list: []));
    Get.back();
  }

}
