import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/auth/utils.dart';
import '../../../viewmodel/auth_viewmodel/auth_viewmodels.dart';

class InputUserNameWidget extends StatelessWidget {
  final FocusNode usernameFocusNode, passwordFocusNode;
  const InputUserNameWidget(
      {Key? key,
      required this.usernameFocusNode,
      required this.passwordFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, provider, child) {
        return TextFormField(
          keyboardType: TextInputType.name,
          focusNode: usernameFocusNode,
          decoration: const InputDecoration(
              hintText: 'Username',
              labelText: 'Username',
              prefixIcon: Icon(Icons.alternate_email)),
          onFieldSubmitted: (value) {
            Utils.fieldFocusChange(
                context, usernameFocusNode, passwordFocusNode);
          },
          onChanged: (value) {
            provider.setUser_name(value);
          },
        );
      },
    );
  }
}
