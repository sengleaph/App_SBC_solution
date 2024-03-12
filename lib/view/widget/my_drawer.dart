import 'package:flutter/material.dart';
import 'package:sbc_app/view/history/history_page.dart';
import 'package:sbc_app/view/home_page.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/view/profile_page/profile_page.dart';

class MyDraw extends StatelessWidget {
  const MyDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * .60,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                ),
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/placeholder.png')),
                currentAccountPictureSize: Size.square(75),
                accountName: const Text(
                  "Seang sengleaph",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                accountEmail: null),
            ListTile(
              title: const Text(
                "Home",
              ),
              leading: Icon(
                Icons.home_filled,
                color: Colors.green.shade700,
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottinNavigationBar(),
                    ));
              },
            ),
            ListTile(
              title: const Text(
                "Profile",
              ),
              leading: Icon(
                Icons.person,
                color: Colors.green.shade700,
              ),
              onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));},
            ),
            ListTile(
              title: const Text(
                "History",
              ),
              leading: Icon(
                Icons.history,
                color: Colors.green.shade700,
              ),
              onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));},
            ),
            ListTile(
              title: const Text(
                "Change Password",
              ),
              leading: Icon(
                Icons.password,
                color: Colors.green.shade700,
              ),
            ),
            ListTile(
              title: const Text(
                "Contact Us",
              ),
              leading: Icon(
                Icons.headphones,
                color: Colors.green.shade700,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Log In"),
              ),
            ),
          ],
        ));
  }
}
