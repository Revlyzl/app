// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:app/controller/dashboardController.dart';
// import 'package:app/model/productionOrder.dart';
// import 'package:app/widget/bottomNavbar.dart';
// import 'package:app/widget/search_bar.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   final DashboardController controller = Get.put(DashboardController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Dashboard', style: TextStyle(fontSize: 20)),
//             Text('Welcome to myapp!✨',
//                 style: TextStyle(fontSize: 12, color: Colors.white)),
//           ],
//         ),
//         toolbarHeight: 80,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Popular Product'),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildEmotionColumn('🧃', 'Beverage'),
//                 _buildEmotionColumn('🍫', 'Chocolate'),
//                 _buildEmotionColumn('🍪', 'Biscuit'),
//               ],
//             ),
//             const SizedBox(height: 20),

//             SearchBarApp(controller: controller),

//             const SizedBox(height: 20),
//             const Text('Production Material Report'),
//             Obx(() {
//               if (controller.isLoading.isTrue) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return _buildReportBox(controller.filteredProductionOrders);
//               }
//             }),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavbar(),
//     );
//   }

//   Widget _buildEmotionColumn(String emoji, String label) {
//     return Column(
//       children: [
//         Container(
//           height: 100,
//           width: 100,
//           color: Colors.red,
//           child: Center(
//             child: Text(emoji, style: TextStyle(fontSize: 40)),
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(label),
//       ],
//     );
//   }

//   Widget _buildReportBox(List<ProductionOrder> productionOrders) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       height: 350,
//       decoration: const BoxDecoration(color: Colors.red),
//       child: SingleChildScrollView(
//         child: Column(
//           children:
//               productionOrders.map((order) => _buildReportCard(order)).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildReportCard(ProductionOrder order) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Card(
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Material Name: ${order.materialName}'),
//               Text('Material Code: ${order.materialCode}'),
//               Text('Shift: ${order.shift}'),
//               Text('Plant: ${order.plantName}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/dashboardController.dart';
import 'package:app/model/productionOrder.dart';
import 'package:app/widget/bottomNavbar.dart';
import 'package:app/widget/search_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard', style: TextStyle(fontSize: 20)),
            Text('Welcome to myapp!✨',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Popular Product'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEmotionColumn('🧃', 'Beverage'),
                _buildEmotionColumn('🍫', 'Chocolate'),
                _buildEmotionColumn('🍪', 'Biscuit'),
              ],
            ),
            const SizedBox(height: 20),

            // Search Bar
            SearchBarApp(controller: controller),

            const SizedBox(height: 20),
            const Text('Production Material Report'),
            Obx(() {
              if (controller.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // Display all production data in the material report
                return _buildReportBox(controller.productionOrders);
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Widget _buildEmotionColumn(String emoji, String label) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(
            child: Text(emoji, style: TextStyle(fontSize: 40)),
          ),
        ),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }

  Widget _buildReportBox(List<ProductionOrder> productionOrders) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 350,
      decoration: const BoxDecoration(color: Colors.red),
      child: SingleChildScrollView(
        child: Column(
          children:
              productionOrders.map((order) => _buildReportCard(order)).toList(),
        ),
      ),
    );
  }

  Widget _buildReportCard(ProductionOrder order) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Material Name: ${order.materialName}'),
              Text('Material Code: ${order.materialCode}'),
              Text('Shift: ${order.shift}'),
              Text('Plant: ${order.plantName}'),
            ],
          ),
        ),
      ),
    );
  }
}
