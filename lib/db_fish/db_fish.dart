import 'dart:convert';
import 'package:fish_tank/db_fish/fish_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBFish extends GetxService {
  late Database dbBase;

  Future<DBFish> init() async {
    await createFishDB();
    return this;
  }

  createFishDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'fish.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createFishTable(db);
        });
  }

  createFishTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS fish (id INTEGER PRIMARY KEY, createdTime TEXT, image BLOB, type INTEGER, list TEXT)');
  }

  insertFishTank(FishTankEntity entity) async {
    final id = await dbBase.insert('fish', {
      'createdTime': entity.createdTime.toIso8601String(),
      'image': entity.image,
      'type': entity.type,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    });
    return id;
  }

  updateFishTank(FishTankEntity entity) async {
    await dbBase.update('fish', {
      'image': entity.image,
      'type': entity.type,
      'list': jsonEncode(entity.list.map((e) => e.toJson()).toList()),
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanFishData() async {
    await dbBase.delete('fish');
  }

  Future<List<FishTankEntity>> getFishAllData() async {
    var result = await dbBase.query('fish', orderBy: 'createdTime DESC');
    return result.map((e) {
      final entity = FishTankEntity.fromJson(e);
      entity.list = (jsonDecode(e['list'] as String) as List).map((e) => FishEntity.fromJson(e)).toList();
      return entity;
    }).toList();

    // return result.map((e) => FishTankEntity.fromJson(e)).toList();
  }
}
