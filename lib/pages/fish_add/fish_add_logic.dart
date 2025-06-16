import 'dart:convert';
import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../db_fish/db_fish.dart';
import '../../db_fish/fish_entity.dart';

class FishAddLogic extends GetxController {

  DBFish dbFish = Get.find();

  Uint8List? image;
  String bodyLength = '';

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
    if (bodyLength.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter body length');
      return;
    }
    final entity = FishEntity(
      createdTime: DateTime.now(),
      image: base64Encode(image!),
      type: type,
      bodyLength: bodyLength,
    );
    Get.back(result: entity);
  }

}
