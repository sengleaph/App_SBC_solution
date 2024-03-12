import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbc_app/view/auth/widget/input_email_widget.dart';
import 'package:sbc_app/view/auth/widget/input_password.dart';
import 'package:sbc_app/view/auth/widget/login_button_widget.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';

import '../../util/auth/login_access_btn.dart';
import '../../util/auth/utils.dart';
import '../../viewmodel/auth_viewmodel/auth_viewmodels.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier(true);
  // TextEditingController _usernameController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  //
  // FocusNode usernameFocusNode = FocusNode();
  // FocusNode passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final usernameNode = FocusNode();
  final passwordNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    usernameNode.dispose();
    passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
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
                        margin: EdgeInsets.symmetric(horizontal: 52),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 90,
                        ),
                        // child: Column(
                        //   key: formKey,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Login",
                        //       style: TextStyle(
                        //           color: Colors.blueAccent,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 30),
                        //     ),
                        //     SizedBox(height: 20),
                        //     InputUsernameWidget(focusNode: usernameNode, passwordFocusNode: passwordNode, ),
                        //     SizedBox(height: 20),
                        //     InputPasswordWidget(focusNode: passwordNode,),
                        //     SizedBox(height: 20),
                        //     RoundBottunLogin(title: 'Log in',
                        //         // loading: authViewModel.loading,
                        //         onPress: () {
                        //           if (_usernameController.text.isEmpty) {
                        //             Utils.flushBarErrorMessage('please enter username.', context);
                        //           } else if (_passwordController.text.isEmpty) {
                        //             Utils.flushBarErrorMessage(
                        //                 'please enter password', context);
                        //           } else if (_passwordController.text.length < 6) {
                        //             Utils.flushBarErrorMessage(
                        //                 'please should have a least 6 digit', context);
                        //           } else {
                        //             Map data = {
                        //               'username' : _usernameController.text.toString(),
                        //               'password' : _passwordController.text.toString(),
                        //             };
                        //             authViewModel.loginApi(data, context);
                        //             print('api hit');
                        //           }
                        //           Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
                        //         }),
                        //   ],
                        // ),

                        child: Column(
                            key: formKey,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              SizedBox(height: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: _usernameController,
                                    keyboardType: TextInputType.name,
                                    focusNode: usernameFocusNode,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintText: 'Username',
                                        labelText: 'Username',
                                        prefixIcon:
                                            Icon(Icons.alternate_email)),
                                    onFieldSubmitted: (valu) {
                                      Utils.fieldFocusChange(context,
                                          usernameFocusNode, passwordFocusNode);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: _obsecurePassword,
                                      builder: (context, value, child) {
                                        return TextFormField(
                                          controller: _passwordController,
                                          obscureText: _obsecurePassword.value,
                                          obscuringCharacter: '*',
                                          focusNode: passwordFocusNode,
                                          decoration: InputDecoration(
                                              hintText: 'Password',
                                              labelText: 'Password',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              prefixIcon: Icon(Icons.lock_open),
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    _obsecurePassword.value =
                                                        !_obsecurePassword
                                                            .value;
                                                  },
                                                  child: Icon(_obsecurePassword
                                                          .value
                                                      ? Icons
                                                          .visibility_off_outlined
                                                      : Icons.visibility))),
                                        );
                                      }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  RoundBottunLogin(
                                      title: 'Log in',
                                      // loading: authViewModel.loading,
                                      onPress: () {
                                        if (_usernameController.text.isEmpty) {
                                          Utils.flushBarErrorMessage(
                                              'please enter username.',
                                              context);
                                        } else if (_passwordController
                                            .text.isEmpty) {
                                          Utils.flushBarErrorMessage(
                                              'please enter password', context);
                                        } else if (_passwordController
                                                .text.length <
                                            6) {
                                          Utils.flushBarErrorMessage(
                                              'please should have a least 6 digit',
                                              context);
                                        } else {
                                          Map data = {
                                            'username': _usernameController.text
                                                .toString(),
                                            'password': _passwordController.text
                                                .toString(),
                                          };
                                          authViewModel.loginApi(data, context);
                                          print('api hit');
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BottinNavigationBar(),
                                            ));
                                      }),
                                ],
                              ),
                            ]))
                  ])
            ])));
  }
}
