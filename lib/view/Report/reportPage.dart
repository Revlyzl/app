import 'package:app/widget/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:app/model/productionOrder.dart';
import 'package:get/get.dart';
import 'package:app/controller/dashboardController.dart';
import 'package:app/widget/search_bar.dart';

class ReportContainer extends StatefulWidget{
  const ReportContainer({Key? key}) : super(key: key);
  @override
  
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ReportContainer>{
  var isLoading = true.obs;
  var productionOrders = <ProductionOrder>[].obs;
  var filteredProductionOrders = <ProductionOrder>[].obs;
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reports', style: TextStyle(fontSize: 20)),
            Text('Look at the reports!📈',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        toolbarHeight: 80,

        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SearchBarApp(controller: controller),
            
            const SizedBox(height: 20),
            const Text('Production Material Report'),
            Obx(() {
              if (controller.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return _buildReportBox(controller.filteredProductionOrders);
              }
            }),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Widget _buildReportBox(List<ProductionOrder> productionOrders) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 500,
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