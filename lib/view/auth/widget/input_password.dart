import 'package:flutter/material.dart';

class InputPasswordWidget extends StatefulWidget {
  InputPasswordWidget({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
                prefixIcon: Icon(Icons.lock_open),
                suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value =
                      !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility))),
          );
        });
  }
}
