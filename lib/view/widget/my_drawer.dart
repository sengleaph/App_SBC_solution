import 'package:flutter/material.dart';

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
                    child: Image.network(
                        'https://i.pinimg.com/originals/5f/b2/1a/5fb21aefc0aa94d8a84531611d8fe708.png')),
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
            ),
            ListTile(
              title: const Text(
                "Profile",
              ),
              leading: Icon(
                Icons.person,
                color: Colors.green.shade700,
              ),
            ),
            ListTile(
              title: const Text(
                "History",
              ),
              leading: Icon(
                Icons.history,
                color: Colors.green.shade700,
              ),
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
