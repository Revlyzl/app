import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/view/Dashboard/dashboard.dart';
import 'package:app/view/Report/reportPage.dart';
import 'package:app/widget/controller/bottom_navbar_controller.dart';

class BottomNavbar extends StatelessWidget {
  final BottomNavbarController _controller = Get.put(BottomNavbarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
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
      currentIndex: _controller.selectedIndex.value,
      selectedItemColor: Colors.red,
      onTap: (index) {
        _controller.changeIndex(index);
        if (index == 0) {
          Get.offAll(() => Dashboard(), transition: Transition.fade);
        } else if (index == 1) {
          Get.offAll(() => ReportPage(), transition: Transition.fade);
        }
      },
    ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:app/view/Dashboard/dashboard.dart';
// // import 'package:app/widget/controller/bottom_navbar_controller.dart';
// import 'package:app/view/Report/reportPage.dart';

// class BottomNavbar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _getSelectedIndex(),
//       onTap: (index) {
//         _onItemTapped(index);
//       },
//       selectedItemColor: Colors.red,
//       unselectedItemColor: Colors.grey,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
//         BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//       ],
//     );
//   }

//   int _getSelectedIndex() {
//     String currentRoute = Get.currentRoute;
//     if (currentRoute == '/dashboard') return 0;
//     if (currentRoute == '/report') return 1;
//     if (currentRoute == '/settings') return 2;
//     return 0;
//   }

//   void _onItemTapped(int index) {
//     String currentRoute = Get.currentRoute;
//     if (index == 0 && currentRoute != '/dashboard') {
//       Get.offAll(() => Dashboard(), transition: Transition.fade);
//     } else if (index == 1 && currentRoute != '/report') {
//       Get.offAll(() => ReportContainer(), transition: Transition.fade);
//     } 
//   }
// }