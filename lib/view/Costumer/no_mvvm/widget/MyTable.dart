// import 'package:flutter/material.dart';
//
// import '../../../model/customer_model/costumer_model.dart';
//
// class DataTableTest extends StatelessWidget {
//   // CustomerData? customerData;
//
//
//
//
//
//   // DataTableTest({required this.customerData});
//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: const <DataColumn>[
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'Name',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'Age',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'Role',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//         DataColumn(
//           label: Expanded(
//             child: Text(
//               'view',
//               style: TextStyle(fontStyle: FontStyle.italic),
//             ),
//           ),
//         ),
//       ],
//       rows: const <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(
//
//               GestureDetector(child:
//               Text(''))
//             ),
//             DataCell(Text('19')),
//             DataCell(Text('Student')),
//             DataCell(Text('hkyflyuf')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Janine')),
//             DataCell(Text('43')),
//             DataCell(Text('Professor')),
//             DataCell(Text('Pguyfid')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('William')),
//             DataCell(Text('27')),
//             DataCell(Text('Associate Professor')),
//             DataCell(Text('Associate Professor')),
//           ],
//         ),
//       ],
//     );
//   }
// }