import 'package:fish_tank/pages/fish_first/fish_first_logic.dart';
import 'package:fish_tank/pages/fish_first/fish_first_view.dart';
import 'package:fish_tank/pages/fish_second/fish_second_view.dart';
import 'package:fish_tank/pages/fish_tank_add/fish_tank_add_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fish_tab_logic.dart';

class FishTabPage extends GetView<FishTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [FishFirstPage(), FishTankAddPage(), FishSecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navFishBars()),
    );
  }

  Widget _navFishBars() {
    return Container(
      height: 125,
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg2.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/item0.webp',
              width: 22,
              height: 22,
              fit: BoxFit.cover,
            ),
            label: 'Home',
          ),
        const BottomNavigationBarItem(
            icon: SizedBox(width: 30, height: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/item1.webp',
              width: 22,
              height: 22,
              fit: BoxFit.cover,
            ),
            label: 'Setting',
          ),
        ],
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          if (index == 1) {
            Get.toNamed('/fish_add')?.then((_) {
              FishFirstLogic firstLogic = Get.find();
              firstLogic.getData();
            });
          } else {
            controller.currentIndex.value = index;
            controller.pageController.jumpToPage(index);
          }
        },
      ),
    );
  }
}
