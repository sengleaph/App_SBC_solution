import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sbc_app/view/history/widget/my_data_time.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';

import '../widget/my_drawer.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage ({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 25,
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/sbc_app.jpg',
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text('SBC Solution', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      drawer: MyDraw(),
      body: MyDataTime(),

    );
  }
}
