import 'package:flutter/material.dart';
import 'package:sbc_app/view/home_page.dart';

import '../history/history_page.dart';
import '../profile_page/profile_page.dart';

class BottinNavigationBar extends StatefulWidget {
  const BottinNavigationBar({super.key});

  @override
  State<BottinNavigationBar> createState() => _BottinNavigationBarState();
}

class _BottinNavigationBarState extends State<BottinNavigationBar> {
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int index = 0;
  List pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      //=======================================================================
      // add to every page?
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: 60,
            backgroundColor: Colors.white,
          ),
          child: NavigationBar(
              indicatorColor: Colors.tealAccent.shade100,
              // height: 60,
// indicatorShape: Border.symmetric(horizontal: BorderSide()),
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined, color: Colors.green.shade900),
                    selectedIcon:
                        Icon(Icons.home, color: Colors.green.shade900),
                    label: ''),
                NavigationDestination(
                    icon: Icon(Icons.history, color: Colors.green.shade900),
                    selectedIcon:
                        Icon(Icons.history_sharp, color: Colors.green.shade900),
                    label: ''),
                NavigationDestination(
                    icon: Icon(Icons.person_outline, color: Colors.green.shade900),
                    selectedIcon: Icon(Icons.person,
                        color: Colors.green.shade900),
                    label: ''),

                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     // IconButton(
                //     //     icon: Icon(Icons.history, size: 30, color: Colors.white,),
                //     //     onPressed: () {
                //     //       Navigator.pushReplacement(
                //     //           context,
                //     //           MaterialPageRoute(
                //     //             builder: (context) => HistoryPage(),
                //     //           ));
                //     //     }),
                //     IconButton(
                //         icon: Icon(Icons.history, size: 30, color: Colors.white,),
                //         onPressed: () {
                //           Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => HistoryPage(),
                //               ));
                //         }),
                //     // IconButton(icon: Icon(Icons.home_filled), onPressed: () {}),
                //     IconButton(
                //         icon: Icon(Icons.person, size: 30, color: Colors.white,),
                //         onPressed: () {
                //           Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => ProfilePage(),
                //               ));
                //         }),
                //   ],
                // ),
              ])),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     child: Icon(
      //       Icons.home_filled,
      //       size: 30,
      //       color: Colors.green.shade900,
      //     ),
      //     onPressed: () {
      //       Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => HomePage(),
      //           ));
      //     }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
