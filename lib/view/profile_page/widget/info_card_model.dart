import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // const InfoCard ({super.key});

  String? text;
  IconData? icon;
  Function? onPressed;

  InfoCard({required this.text,required this.icon,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.green.shade900,
          ),
          title: Text(
            text!,
            style: TextStyle(
              color: Colors.green.shade900
            ),
          ),
        ),
      ),
    );
  }
}
