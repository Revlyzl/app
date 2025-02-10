// import 'package:app/widget/bottomNavbar.dart';
// import 'package:flutter/material.dart';

// class ReportContainer extends StatefulWidget{
//   const ReportContainer({Key? key}) : super(key: key);
//   @override
  
//   _ReportState createState() => _ReportState();
// }

// class _ReportState extends State<ReportContainer>{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Reports', style: TextStyle(fontSize: 20)),
//             Text('Look at the reports!📈',
//                 style: TextStyle(fontSize: 12, color: Colors.white)),
//           ],
//         ),
//         toolbarHeight: 80,
//       ),
//       body: Container(),
//       bottomNavigationBar: BottomNavbar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:app/widget/bottomNavbar.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false, // Remove back arrow
        title: Text('Reports'),
      ),
      body: Center(
        child: Text('Reports Page'),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}