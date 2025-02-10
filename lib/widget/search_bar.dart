// import 'package:flutter/material.dart';
// import 'package:app/controller/dashboardController.dart';
// import 'package:get/get.dart';

// class SearchBarApp extends StatefulWidget {
//   final DashboardController controller;

//   const SearchBarApp({Key? key, required this.controller}) : super(key: key);

//   @override
//   State<SearchBarApp> createState() => _SearchBarAppState();
// }

// class _SearchBarAppState extends State<SearchBarApp> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   bool _isSearchFocused = false;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_onFocusChange);
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//     _searchController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     setState(() {
//       _isSearchFocused = _focusNode.hasFocus;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _searchController,
//           focusNode: _focusNode,
//           decoration: InputDecoration(
//             prefixIcon: Icon(Icons.search),
//             hintText: 'Search Material Name',
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//           onChanged: (query) {
//             widget.controller.filterProductionOrders(query);
//           },
//         ),
//         const SizedBox(height: 10),
//         if (_isSearchFocused)
//           Obx(() => widget.controller.filteredProductionOrders.isEmpty
//               ? const Text("No results found")
//               : SizedBox(
//                   height: 100,
//                   child: ListView.builder(
//                     itemCount:
//                         widget.controller.filteredProductionOrders.length,
//                     itemBuilder: (context, index) {
//                       final order =
//                           widget.controller.filteredProductionOrders[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(vertical: 5),
//                         child: ListTile(
//                           title: Text(order.materialName,
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Material Code: ${order.materialCode}"),
//                               Text("Shift: ${order.shift}"),
//                               Text("Plant: ${order.plantName}"),
//                             ],
//                           ),
//                           onTap: () {
//                             _searchController.text = order.materialName;
//                             widget.controller
//                                 .filterProductionOrders(order.materialName);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 )),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:app/controller/dashboardController.dart';
import 'package:get/get.dart';

class SearchBarApp extends StatefulWidget {
  final DashboardController controller;

  const SearchBarApp({Key? key, required this.controller}) : super(key: key);

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isSearchFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        TextField(
          controller: _searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search Material Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (query) {
            widget.controller.filterProductionOrders(query);
          },
        ),
        const SizedBox(height: 10),

        // Display Search Results (only when search bar is focused)
        if (_isSearchFocused)
          Obx(() => widget.controller.filteredProductionOrders.isEmpty
              ? const Text("No results found")
              : SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: widget.controller.filteredProductionOrders.length,
                    itemBuilder: (context, index) {
                      final order = widget.controller.filteredProductionOrders[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(order.materialName,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Material Code: ${order.materialCode}"),
                              Text("Shift: ${order.shift}"),
                              Text("Plant: ${order.plantName}"),
                            ],
                          ),
                          onTap: () {
                            _searchController.text = order.materialName;
                            widget.controller.filterProductionOrders(order.materialName);
                          },
                        ),
                      );
                    },
                  ),
                )),
      ],
    );
  }
}