import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'fish_edit_logic.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FishEditView extends GetView<PageLogic> {
  const FishEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.botsford.value
              ? LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  lineHeight: 8.0,
                  percent: controller.progress.value,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
            barRadius: const Radius.circular(10),
                )
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.wblvem();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
