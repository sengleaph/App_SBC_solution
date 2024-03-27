import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../history/history_page.dart';
import '../home_page.dart';
import '../widget/my_drawer.dart';
import 'widget/info_card_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

  const phone =   "(+855) 17 35 02 16";
  const email = "sengleaphseang@gmail.com";
  const gender = "male";
  const company = "Sbc";

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarColor: Colors.white,
        // ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 25,
            color: Colors.black,
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
            Text('SBC Solution', style: TextStyle(
              color: Colors.black
            )),
          ],
        ),
      ),
      drawer: MyDraw(),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/images/placeholder.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Seang Sengleaph",
                    style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                  SizedBox(height: 15),
                  InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),
                  InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
                  InfoCard(text: gender, icon: Icons.male, onPressed: () async {}),
                  InfoCard(text: company, icon: Icons.account_balance, onPressed: () async {}),

                ],
              ),
            ),
          ])),

      //=======================================================================
      // add to every page?
      // bottomNavigationBar: BottomAppBar(
      //   height: 60,
      //   color: Colors.green.shade900,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(
      //           icon: Icon(
      //             Icons.history,
      //             size: 30,
      //             color: Colors.white,
      //           ),
      //           onPressed: () {
      //             Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => HistoryPage(),
      //                 ));
      //           }),
      //       // IconButton(icon: Icon(Icons.home_filled), onPressed: () {}),
      //       IconButton(
      //           icon: Icon(
      //             Icons.person,
      //             size: 30,
      //             color: Colors.white,
      //           ),
      //           onPressed: () {
      //             Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => ProfilePage(),
      //                 ));
      //           }),
      //     ],
      //   ),
      // ),
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
