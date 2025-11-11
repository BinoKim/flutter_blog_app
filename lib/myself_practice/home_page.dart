// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class HomePage extends StatelessWidget {
//   // final List<PostInfo> postInfos = [];
//   final items = List.generate(20, (index) {});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BLOG", style: TextStyle(fontWeight: FontWeight.bold)),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Recent Post"),
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: items.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Stack(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 300,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Title ${index}",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text("description"),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.grey,
//                           ),
//                           child: Text("image")),
//                         SizedBox(height: 10,),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Icon(Icons.add, color: Colors.red,);
//         },
//         ),
//     );
//   }
// }

// class PostInfo {
//   final String title;
//   final String subtitle;
//   PostInfo(this.title, this.subtitle);
// }
