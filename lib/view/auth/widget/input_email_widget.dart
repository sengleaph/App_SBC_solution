import 'package:flutter/material.dart';

import '../../../util/auth/utils.dart';

class InputUsernameWidget extends StatelessWidget {
  final FocusNode focusNode , passwordFocusNode;
  InputUsernameWidget({Key? key ,required this.focusNode , required this.passwordFocusNode}) : super(key: key);

  TextEditingController _usernameController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.name,
      focusNode: usernameFocusNode,
      decoration: InputDecoration(
          hintText: 'Username',
          labelText: 'Username',
          prefixIcon: Icon(Icons.alternate_email)),
      onFieldSubmitted: (valu) {
        Utils.fieldFocusChange(
            context, usernameFocusNode, passwordFocusNode);
      },
    );
         }

}