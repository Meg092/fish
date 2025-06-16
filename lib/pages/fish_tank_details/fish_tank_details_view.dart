import 'dart:convert';
import 'dart:math';

import 'package:fish_tank/db_fish/fish_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'fish_tank_details_logic.dart';

class FishTankDetailsPage extends GetView<FishTankDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<FishTankDetailsLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const Text(
                'Details of the fish tank',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                child: Text(
                  typeTitles[controller.entity.type],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ).decorated(
                  color: const Color(0xff99ceff),
                  borderRadius: BorderRadius.circular(8)),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '- Added fish -',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              controller.entity.list.isEmpty
                  ? const Center(
                      child: Text(
                        'No fish added yet.',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: controller.entity.list.length,
                      itemBuilder: (_, index) {
                        final entity = controller.entity.list[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                                  width: 54,
                                  height: 54,
                                  padding: const EdgeInsets.all(2),
                                  child: Image.memory(
                                    base64Decode(entity.image),
                                    fit: BoxFit.cover,
                                  ))
                              .decorated(
                                  color: Colors.white.withOpacity(0.71),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(4)),
                        );
                      }),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: <Widget>[
                  const SizedBox(
                    width: 300,
                    height: 350,
                  ),
                  <Widget>[
                    Image.memory(
                      controller.entity.image,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    ...List.generate(
                        controller.entity.list.length,
                        (e) => Positioned(
                            top: Random().nextDouble() * 200,
                            left: Random().nextDouble() * 200,
                            child: Image.memory(
                              base64Decode(controller.entity.list[e].image),
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            )))
                  ].toStack(),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Add fish',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                          .decorated(
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                const BoxShadow(
                                    color: Color(0xff3b69de),
                                    blurRadius: 10,
                                    offset: Offset(0, 4))
                              ],
                              gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff4f7ffa),
                                    Color(0xff335fd1)
                                  ]))
                          .gestures(onTap: () {
                        Get.toNamed('/fish_add')?.then((value) async {
                          FishEntity result = value as FishEntity;
                          var currentList = controller.entity.list;
                          currentList.add(result);
                          controller.entity.list = currentList;
                          controller.update();
                          await controller.dbFish
                              .updateFishTank(controller.entity);
                        });
                      }))
                ].toStack(alignment: Alignment.center),
              )
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ).decorated(
          image: const DecorationImage(
              image: AssetImage("assets/bg1.webp"), fit: BoxFit.fill)),
    );
  }
}
