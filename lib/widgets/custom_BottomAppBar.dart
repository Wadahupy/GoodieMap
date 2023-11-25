// import 'package:flutter/material.dart';
// import 'package:goodiemap_app/screens/home/home_screen.dart';

// class CustomBottomAppBar extends StatelessWidget {
//   const CustomBottomAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
//       notchMargin: 10,
//       shape: const CircularNotchedRectangle(),
//       color: const Color(0xFF46B177),
//       child: Container(
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             MaterialButton(
//               minWidth: 40,
//               onPressed: () {
//                 setState(() {
//                   currentScreen = homePage();
//                 });
//               },
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, '/map');
//               },
//               customBorder: const CircleBorder(),
//               child: const Column(
//                 children: [
//                   Icon(
//                     Icons.map,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     'Map',
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             InkWell(
//               onTap: () {},
//               customBorder: const CircleBorder(),
//               child: const Column(
//                 children: [
//                   Icon(
//                     Icons.favorite,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     'Favorite',
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               customBorder: const CircleBorder(),
//               child: const Column(
//                 children: [
//                   Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                   Text(
//                     'Profile',
//                     style: TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
