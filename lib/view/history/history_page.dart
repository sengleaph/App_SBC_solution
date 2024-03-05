import 'package:flutter/material.dart';

import '../home_page.dart';
import '../profile_page/profile_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage ({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
      ),
      
      //=======================================================================
      // add to every page?
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.green.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.history, size: 30, color: Colors.white,),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(),
                      ));
                }),
            // IconButton(icon: Icon(Icons.home_filled), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.person, size: 30, color: Colors.white,),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.home_filled,size: 30, color: Colors.green.shade900,),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
