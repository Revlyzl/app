import 'package:app/view/Dashboard/dashboard.dart';
import 'package:app/view/Setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/view/Report/reportPage.dart';
import 'package:app/widget/controller/bottomNavbar_controller.dart';

class BottomNavbar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.red,
        onTap: (int index) {
          controller.selectedIndex.value = index;
          if (index == 1) {
            Get.offAll(() => const ReportContainer());
          } else if (index == 0) {
            Get.offAll(() => const Dashboard());
          }else if(index == 2){
            Get.offAll(()  => SettingContainer());
          }
        },
      );
    });
  }
}
