import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';

import '../../../util/auth/component.dart';
import '../../../util/auth/utils.dart';
import '../../../viewmodel/auth_viewmodel/auth_viewmodels.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, provider, child) {
        return RoundBottun(
            title: 'Log in',
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
                // authViewModel.loginApi(data, context);
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
    );
  }
}
