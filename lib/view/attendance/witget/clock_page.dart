import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sbc_app/model/auth_model/UserModel.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import '../attendence_page.dart';
import 'Scanning/finger_print.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Scanning/response_data_widget.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime _currentTime = DateTime.now();
  bool userAvialable = false;
  late SharedPreferences sharedPreferences;
  late StreamController<String> _timeStreamController;
  late Timer _timer;
  bool auth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentUser();
    _timeStreamController = StreamController<String>();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _timeStreamController.add(DateFormat('hh:mm:ss').format(DateTime.now()));
    });
  }

  void _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if (sharedPreferences.getString('employeeId') != null) {
        setState(() {
          UserModel.username = sharedPreferences.getString('employeeId')!;
          userAvialable = true;
        });
      }
    } catch (e) {
      setState(() {
        userAvialable = false;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_currentTime),
    );
    if (pickedTime != null) {
      setState(() {
        _currentTime = DateTime(
          _currentTime.year,
          _currentTime.month,
          _currentTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            children: [
              Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 1,
                          blurRadius: 2,
                        )
                      ])),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(Icons.access_time),
                    Text("Working Hour's"),
                  ],
                ),
              ),
              // SizedBox(height: 50.0,),
              StreamBuilder(
                  stream: Stream.periodic(Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('hh').format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Hrs.',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade200,
                              //     spreadRadius: 1,
                              //     blurRadius: 2,
                              //   )
                              // ]
                              // color: Colors.red,
                            ),
                            height: 110,
                            width: 110,
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                  DateFormat('mm').format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Min.',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              // boxShadow: [
                              //     BoxShadow(
                              //       color: Colors.grey.shade100,
                              //       spreadRadius: 1,
                              //       blurRadius: 1,
                              //     )
                              // ]
                              // color: Colors.red,
                            ),
                            height: 110,
                            width: 110,
                          ),
                          Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat('ss').format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sec.', style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade200,
                              //     spreadRadius: 1,
                              //     blurRadius: 2,
                              //   )
                              // ]
                              // color: Colors.red,
                            ),
                            height: 110,
                            width: 110,
                          ),
                        ],
                      ),
                    );
                  }),
              Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(50)),
                              // color: Colors.grey,
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.pink.shade300,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Container(
                                height: 175,
                                width: 175,
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade400,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 23, top: 23),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade500,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    bool auth =
                                        await Authentication.authentication();
                                    print('can authentication: $auth');
                                    if (auth = true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BottinNavigationBar(),
                                          ));
                                      // Navigator.pop(context);
                                    }
                                  },
                                  child: Icon(
                                    Icons.touch_app_outlined,
                                    color: Colors.white,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: SizedBox(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_currentTime.hour}:${_currentTime.minute}:${_currentTime.second}',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.access_time),
                                            Text(
                                              'Clock In',
                                              // style: TextStyle(
                                              // fontSize: 15,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: 110,
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          // '${_currentTime.hour}:${_currentTime.minute}:${_currentTime.second}',
                                          '==/==',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.access_time),
                                            Text(
                                              'Clock out',
                                              // style: TextStyle(
                                              // fontSize: 15,
                                              // ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: 110,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      // if(auth = true){

      // }
    ]));
  }
}
