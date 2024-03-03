import 'package:flutter/material.dart';
import 'package:sbc_app/util/constants/color.dart';
import 'package:sbc_app/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        // body: Column(
        //   children: [
        //     Container(
        //
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Container(
        //                 color: Colors.purpleAccent,
        //                 margin: EdgeInsets.symmetric(horizontal: 52),
        //                 padding: EdgeInsets.symmetric(
        //                   horizontal: 24,
        //                   vertical: 105,
        //                 ),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       "Login",
        //                     ),
        //                     SizedBox(height: 36),
        //                     Container(
        //                       child: Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: TextField(
        //                           controller: emailController,
        //                           decoration: InputDecoration(
        //                             hintText: 'Enter your username or phone number',
        //                             labelText: 'Username/Phone Number',
        //                             border: OutlineInputBorder(),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     SizedBox(height: 23),
        //                     Container(
        //                       child: Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: TextField(
        //                           controller: passwordController,
        //                           obscureText: true,
        //                           decoration: InputDecoration(
        //                             hintText: 'Enter your password',
        //                             labelText: 'Password',
        //                             border: OutlineInputBorder(),
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     SizedBox(height: 9),
        //                     Align(
        //                       alignment: Alignment.centerRight,
        //                       child: Text(
        //                         "Forgot Password?",
        //                       ),
        //                     ),
        //                     SizedBox(height: 19),
        //                     ElevatedButton(
        //                       onPressed: () {},
        //                       child: Text("Log In"),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(children: [
              Positioned(
                right: -200,
                bottom: -150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    width: 400,
                    height: 400,
                    color: Colors.purpleAccent.shade700,
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ),
              Positioned(
                top: -100,
                left: -200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    width: 400,
                    height: 400,
                    color: Colors.greenAccent.shade700,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      margin: EdgeInsets.symmetric(horizontal: 52),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 90,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: '',
                                  labelText: 'Username/Phone Number',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: '',
                                  labelText: 'Password',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 9),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                            ),
                          ),
                          SizedBox(height: 19),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green)
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            child: Text("Log In"),
                          ),
                        ],
                      ),
                    )
                  ])
            ])));
  }
}
