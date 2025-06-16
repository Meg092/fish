import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

class FishEntity {
  DateTime createdTime;
  String image;
  int type;
  String bodyLength;

  FishEntity({
    required this.createdTime,
    required this.image,
    required this.type,
    required this.bodyLength,
  });

  factory FishEntity.fromJson(Map<String, dynamic> json) {
    return FishEntity(
      createdTime: DateTime.parse(json['createdTime'] as  String) ,
      image: json['image'] as String,
      type: json['type'] as int,
      bodyLength: json['bodyLength'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime.toIso8601String(),
      'image': image,
      'type': type,
      'bodyLength': bodyLength,
    };
  }
}

class FishTankEntity {
  int id;
  DateTime createdTime;
  Uint8List image;
  int type;
  List<FishEntity> list;

  FishTankEntity({
    required this.id,
    required this.createdTime,
    required this.image,
    required this.type,
    required this.list,
  });


  factory FishTankEntity.fromJson(Map<String, dynamic> json) {
    return FishTankEntity(
      id: json['id'] as int,
      createdTime: DateTime.parse(json['createdTime'] as String),
      image: json['image'] as Uint8List,
      type: json['type'] as int,
      list: (jsonDecode(json['list']) as List)
          .map((e) => FishEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'image': image,
      'type': type,
      'list': jsonEncode(list.map((e) => e.toJson()).toList()),
    };
  }

  String get createdTimeStr => DateFormat('MM/dd/yyyy').format(createdTime);

}