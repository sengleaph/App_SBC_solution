// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sbc_app/util/auth/login_access_btn.dart';
// import 'package:sbc_app/util/auth/validator.dart';
// import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
// import 'package:sbc_app/viewmodel/auth_viewmodel/auth_viewmodels.dart';
//
// import '../../../util/auth/auth_access.dart';
//
// class LoginButtonWidget extends StatefulWidget {
//   LoginButtonWidget({Key? key}) : super(key: key);
//
//   @override
//   State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
// }
//
// class _LoginButtonWidgetState extends State<LoginButtonWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LoginViewModel>(
//       builder: (context, provider, child) {
//         return RoundBottun(
//           title: 'Login',
//           loading: provider.loginLoading ? true : false,
//           onPress: (){
//
//             if(provider.email.isEmpty){
//               LoginButton.toastMessage('Please enter email');
//             }else if(!AppValidator.emailValidator(provider.email.toString())){
//               LoginButton.flushBarErrorMessage('Please enter valid email', context);
//             }else if(provider.password.isEmpty){
//               LoginButton.flushBarErrorMessage('Please enter password', context);
//             }else if(provider.password.length < 6){
//               LoginButton.flushBarErrorMessage('Please enter 6 digit password', context);
//             }else {
//
//
//               Map data = {
//                 'email' : provider.email.toString(),
//                 'password' : provider.password.toString(),
//               };
//
//               // Map data = {
//               //   'email' : 'eve.holt@reqres.in',
//               //   'password' : 'cityslicka',
//               // };
//
//               provider.loginApi(data).then((value){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
//               }).onError((error, stackTrace){
//                 LoginButton.flushBarErrorMessage(error.toString(), context);
//               });
//
//             }
//             Navigator.push(context, MaterialPageRoute(builder: (context) => BottinNavigationBar(),));
//           },
//         );
//       },
//     );
//   }
// }
//

import 'package:flutter/material.dart';

class RoundBottunLogin extends StatelessWidget {
  const RoundBottunLogin(
      {required this.title,
      this.loading = false,
      required this.onPress,
      super.key});

  final String title;
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
