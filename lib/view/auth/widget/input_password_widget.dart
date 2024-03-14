import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({Key? key, required this.passwordFocusNode})
      : super(key: key);

  final FocusNode passwordFocusNode;
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _obsecurePassword,
        builder: (context, value, child) {
          return TextFormField(
            obscureText: _obsecurePassword.value,
            obscuringCharacter: '*',
            focusNode: passwordFocusNode,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_open),
                suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility))),
          );
        });
  }
}
