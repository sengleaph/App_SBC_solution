import 'package:flutter/material.dart';
import 'package:sbc_app/view/attendance/attendence_page.dart';

import 'finger_print.dart';

class AuthenticateionPage extends StatefulWidget {
  const AuthenticateionPage({super.key});

  @override
  State<AuthenticateionPage> createState() => _AuthenticateionPageState();
}

class _AuthenticateionPageState extends State<AuthenticateionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192350),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 29,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Login with the Finger print",
              style: TextStyle(
                  color: Colors.orange.shade200,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(color: Colors.white60),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () async{
                bool auth = await Authentication.authentication();
                print("can authenticate: $auth");
                if(auth){
                  var push = Navigator.push(context, MaterialPageRoute(builder: (context) => AttendencePage()));
                }
              },
              icon: const Icon(Icons.fingerprint),
              label: const Text("Scan"),
            ),

          ],
        )),
      ),
    );
  }
}
