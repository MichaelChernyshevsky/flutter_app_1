// import 'package:flutter/material.dart';

// import '../menu/bottombar_menu.dart';

// class Dictionaries_screen extends StatelessWidget {
//   const Dictionaries_screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: DictList(),
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }

// class DictList extends StatefulWidget {
//   const DictList({super.key});

//   @override
//   State<DictList> createState() => _DictListState();
// }

// class _DictListState extends State<DictList> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.separated(
//             separatorBuilder: separatorBuilder, 
//             itemCount: itemCount,
//             itemBuilder: (itemBuilder), )
//           ),
//       ],
//     );
//   }
// }