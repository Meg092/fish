import 'package:fish_tank/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'fish_first_logic.dart';

class FishFirstPage extends GetView<FishFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Stack(
              children: [
                Text(
                  'Fish tanks',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = const Color(0xff3c6eef),
                  ),
                ),
                const Text(
                  'Fish tanks',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() {
              return controller.list.value.isEmpty
                  ? const Center(
                      child: Text('No data',style: TextStyle(color: Colors.white),),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.list.value.length,
                      itemBuilder: (_, index) {
                        final entity = controller.list.value[index];
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: 12, top: 12, bottom: 12),
                          child: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.memory(
                                entity.image,
                                width: 67,
                                height: 67,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: <Widget>[
                              Text(
                                entity.createdTimeStr,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              <Widget>[
                                Container(
                                  height: 21,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  alignment: Alignment.center,
                                  child: Text(
                                    typeTitles[entity.type],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ).decorated(
                                    color: const Color(0xff99ceff),
                                    borderRadius: BorderRadius.circular(2)),
                              ].toRow(),
                              const SizedBox(
                                height: 5,
                              ),
                              <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: <Widget>[
                                    Image.asset(
                                      'assets/fish.png',
                                      width: 13,
                                      fit: BoxFit.cover,
                                    )
                                  ].toRow(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(19),
                                    color: const Color(0xfff37e7e)),
                                const SizedBox(width: 10),
                                Text(
                                  '${entity.list.length} items',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xfff37e7e)),
                                )
                              ].toRow()
                            ].toColumn(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start)),
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/img0.webp',
                              width: 72,
                              height: 41,
                              fit: BoxFit.cover,
                            )
                          ].toRow(),
                        )
                            .decorated(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12))
                            .marginOnly(bottom: 10)
                            .gestures(onTap: () {
                          Get.toNamed('/fish_tank_details',
                                  arguments: entity)
                              ?.then((_) {
                            controller.getData();
                          });
                        });
                      });
            })
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).paddingAll(15)),
      ).decorated(
          image: const DecorationImage(
              image: AssetImage('assets/bg0.webp'), fit: BoxFit.fill)),
    );
  }
}
