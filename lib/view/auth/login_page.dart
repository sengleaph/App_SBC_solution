import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import '../../util/auth/component.dart';
import '../../util/auth/utils.dart';
import '../../viewmodel/auth_viewmodel/auth_viewmodels.dart';
import 'widget/input_password_widget.dart';
import 'widget/input_username_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

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
                                  InputUserNameWidget(usernameFocusNode: usernameFocusNode, passwordFocusNode: passwordFocusNode),
                                  InputPasswordWidget(passwordFocusNode: passwordFocusNode),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Consumer<AuthViewModel>(
                                    builder: (context, provider, child) {
                                      return RoundBottun(
                                          title: 'Log in',
                                          // loading: authViewModel.loading,
                                          // onPress: () {
                                          //   // if (provider.username.isEmpty) {
                                          //   //   Utils.flushBarErrorMessage('please enter username.', context);
                                          //   // } else
                                          //     if(!AppValidator.usernameValidator(provider.username.toString())){
                                          //     Utils.flushBarErrorMessage('Please enter valid email', context);
                                          //   } else if (provider.password.isEmpty) {
                                          //     Utils.flushBarErrorMessage(
                                          //         'please enter password', context);
                                          //   } else if (provider.password.length < 6) {
                                          //     Utils.flushBarErrorMessage(
                                          //         'please should have a least 6 digit', context);
                                          //   } else {
                                          //     // Map data = {
                                          //     //   'username' : _usernameController.text.toString(),
                                          //     //   'password' : _passwordController.text.toString(),
                                          //     // };
                                          //     // Map data = {
                                          //     //   'username' : 'sbcsolutions',
                                          //     //   'password' : 'Sbc@12345',
                                          //     // };
                                          //
                                          //     Map data = {
                                          //       'email' : provider.username.toString(),
                                          //       'password' : provider.password.toString(),
                                          //     };
                                          //     authViewModel.loginApi(data, context);
                                          //     // print('api hit');
                                          //
                                          //
                                          //     provider.loginApi(data, context).then((value){
                                          //       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                          //     }).onError((error, stackTrace){
                                          //       Utils.flushBarErrorMessage(error.toString(), context);
                                          //     });
                                          //
                                          //   }
                                          //   // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                          //
                                          // });

                                          // loading: provider.loginLoading ? true : false,
                                          onPress: () {
                                            if (provider.user_name!.isEmpty) {
                                              Utils.flushBarErrorMessage(
                                                  'please enter username.', context);
                                            } else if (provider.password!.isEmpty) {
                                              Utils.flushBarErrorMessage(
                                                  'please enter password', context);
                                            } else if (provider.password!.length < 6) {
                                              Utils.flushBarErrorMessage(
                                                  'please should have a least 6 digit', context);
                                            } else {
                                              Map data = {
                                                'user_name': provider.user_name.toString(),
                                                'password': provider.password.toString(),
                                              };
                                              authViewModel.loginApi(data, context);
                                              print('api hit');
                                              provider.loginApi(data, context).then((value) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => BottinNavigationBar(),
                                                    ));
                                              }).onError((error, stackTrace) {
                                                Utils.flushBarErrorMessage(error.toString(), context);
                                              });
                                            }
                                          });
                                    },
                                  ),
                                ],
                              ),
                                ],
                              ),
                            )])
                  ])
        ));
  }
}
