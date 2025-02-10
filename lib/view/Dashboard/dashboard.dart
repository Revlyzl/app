// import 'package:app/widget/bottomNavbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:app/controller/dashboardController.dart';
// import 'package:app/models/productionOrder.dart';

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
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Dashboard', style: TextStyle(fontSize: 20)),
//             Text('Welcome to myapp!✨',
//                 style: TextStyle(fontSize: 12, color: Colors.white)),
//           ],
//         ),
//         toolbarHeight: 80,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Popular Product'),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildEmotionColumn('🧃', 'Beverage'),
//                 _buildEmotionColumn('🍫', 'Chocolate'),
//                 _buildEmotionColumn('🍪', 'Biscuit'),
//               ],
//             ),
//             SizedBox(height: 50),
//             Text('Production Material Report'),
//             Obx(() {
//               if (controller.isLoading.isTrue) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return _buildReportBox(controller.productionOrders);
//               }
//             }),
//           ],
//         ),
//       ),

//       bottomNavigationBar: BottomNavbar()
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
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(color: Colors.red),
//       child: Column(
//         children:
//             productionOrders.map((order) => _buildReportCard(order)).toList(),
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
import 'package:app/widget/bottomNavbar.dart';
import 'package:app/controller/dashboardController.dart';
import 'package:app/models/productionOrder.dart';

class Dashboard extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false, // Remove back arrow
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard', style: TextStyle(fontSize: 20)),
            Text('Welcome to myapp!✨',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Popular Product'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEmotionColumn('🧃', 'Beverage'),
                _buildEmotionColumn('🍫', 'Chocolate'),
                _buildEmotionColumn('🍪', 'Biscuit'),
              ],
            ),
            SizedBox(height: 50),
            Text('Production Material Report'),
            Obx(() {
              if (controller.isLoading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
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

  // Widget _buildReportBox(List<ProductionOrder> productionOrders) {
  //   return Container(
  //     padding: const EdgeInsets.all(16.0),
  //     decoration: BoxDecoration(color: Colors.red),
  //     child: Column(
  //       children:
  //           productionOrders.map((order) => _buildReportCard(order)).toList(),
  //     ),
  //   );
  // }

  Widget _buildReportBox(List<ProductionOrder> productionOrders) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(color: Colors.red),
    height: 350,
    child: SingleChildScrollView(
      child: Column(
        children: productionOrders.map((order) => _buildReportCard(order)).toList(),
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