import 'dart:convert';
import 'package:app/models/productionOrder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  var isLoading = true.obs;
  var productionOrders = <ProductionOrder>[].obs;

  @override
  void onInit() {
    fetchProductionOrders();
    super.onInit();
  }

  Future<void> fetchProductionOrders() async {
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse('https://api.mayora.co.id/MOA2/WMS/GetProductionOrder?username=MG109519'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        productionOrders.assignAll(
            data.map((json) => ProductionOrder.fromJson(json)).toList());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }
}
