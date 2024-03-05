import 'package:flutter/material.dart';

class TimeLeavePage extends StatelessWidget {
  const TimeLeavePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Leave",
        ),
        // centerTitle: true,
      ),
    );
  }
}
