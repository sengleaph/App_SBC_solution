// import 'package:flutter/material.dart';
//
// class RoundBottun extends StatelessWidget {
//   const RoundBottun(
//       {required this.title,
//         this.loading = false,
//         required this.onPress,
//         super.key});
//
//   final String title;
//   final bool loading;
//   final VoidCallback onPress;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPress,
//       child: Container(
//         height: 40,
//         width:  MediaQuery.of(context).size.width * 0.25,
//         decoration: BoxDecoration(
//             color: Colors.green, borderRadius: BorderRadius.circular(5)),
//         child: Center(
//             child: loading
//                 ? const CircularProgressIndicator()
//                 : Text(
//               title,
//               style: TextStyle(color: Colors.white),
//             )),
//       ),
//     );
//   }
// }
