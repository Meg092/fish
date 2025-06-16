import 'package:fish_tank/pages/fish_add/fish_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'fish_add_logic.dart';

class FishAddPage extends GetView<FishAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<FishAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Stack(
                children: [
                  Text(
                    'Add fish',
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
                    'Add fish',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: 240,
                      height: 240,
                      child: controller.image != null
                          ? Image.memory(
                              controller.image!,
                              fit: BoxFit.cover,
                            )
                          : <Widget>[
                              const Icon(
                                Icons.add,
                                size: 58,
                                color: Colors.grey,
                              )
                            ].toColumn(
                              mainAxisAlignment: MainAxisAlignment.center),
                    )
                        .decorated(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(0xffe6e6e6), width: 2))
                        .gestures(onTap: () {
                      controller.imageSelected();
                    }),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    'Add photos of the fish',
                    style: TextStyle(fontSize: 16, color: Color(0xffc4c4c4)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  <Widget>[
                    Expanded(
                        child: Container(
                      height: 40,
                      child: <Widget>[
                        Text(
                          typeTitles[0],
                          style: TextStyle(
                              color: controller.type == 0
                                  ? const Color(0xff005df7)
                                  : Colors.black),
                        ),
                        Visibility(
                            visible: controller.type == 0,
                            child: Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/img1.webp',
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                              ),
                            ))
                      ].toStack(alignment: Alignment.center),
                    )
                            .decorated(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color: controller.type == 0
                                        ? const Color(0xff005df7)
                                        : const Color(0xffd1d1d6)))
                            .gestures(onTap: () {
                      controller.type = 0;
                      controller.update();
                    })),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Container(
                      height: 40,
                      child: <Widget>[
                        Text(
                          typeTitles[1],
                          style: TextStyle(
                              color: controller.type == 1
                                  ? const Color(0xff005df7)
                                  : Colors.black),
                        ),
                        Visibility(
                            visible: controller.type == 1,
                            child: Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/img1.webp',
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                              ),
                            ))
                      ].toStack(alignment: Alignment.center),
                    )
                            .decorated(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                    color: controller.type == 1
                                        ? const Color(0xff005df7)
                                        : const Color(0xffd1d1d6)))
                            .gestures(onTap: () {
                      controller.type = 1;
                      controller.update();
                    }))
                  ].toRow(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: FishTextField(
                        hintText: 'Body length input',
                        maxLength: 12,
                        value: controller.bodyLength,
                        onChange: (v) {
                          controller.bodyLength = v;
                        }),
                  ).decorated(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xffd1d1d6))),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add',
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
                              colors: [Color(0xff4f7ffa), Color(0xff335fd1)]))
                      .gestures(onTap: () {
                    controller.addData();
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                ].toColumn(),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ).decorated(
          image: const DecorationImage(
              image: AssetImage('assets/bg1.webp'), fit: BoxFit.fill)),
    );
  }
}
