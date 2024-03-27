import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/Custumer_page.dart';
import 'package:sbc_app/view/attendance/attendence_page.dart';
import 'package:sbc_app/view/history/history_page.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/view/product/product.dart';
import 'package:sbc_app/view/profile_page/profile_page.dart';
import 'package:sbc_app/view/report/report_page.dart';
import 'package:sbc_app/view/salary/salaryForm.dart';
import 'package:sbc_app/view/time_leave/time_leave_page.dart';
import 'package:sbc_app/view/widget/my_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_model/UserModel.dart';
import 'sales_surveys/no_mvvm/sale_survey_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  var height, width;

  DateTime _currentTime = DateTime.now();
  bool userAvialable = false;
  late SharedPreferences sharedPreferences;

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

  List imgData = [
    // "assets/images/attendance.png",
    // "assets/images/time_leave.png",
    // "assets/images/day_off.png",
    "assets/images/customer.png",
    "assets/images/sale_survey.png",
    // "assets/images/salary.png",
    // "assets/images/OT.png",
    "assets/images/report.png",
    "assets/images/product.png",
  ];

  List titles = [
    // "Attendance",
    // "Time Leave",
    // "Day Off",
    "Customer",
    "Sales Survey",
    // "Salary",
    "Report",
    "Product"
  ];
  List navigating = [
    // AttendencePage(),
    // TimeLeavePage(),
    // AttendencePage(),
    CustumerPage(),
    SaleSurveyPage(),
    // SalaryForm(),
    ReportPage(),
    ProductPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/sbc_app.jpg',
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text('SBC Solution', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      drawer: MyDraw(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              AssetImage('assets/images/placeholder.png'),
                        ),
                        Text('si fu'),
                        Spacer(),
                        Text(
                            '${_currentTime.day}/${_currentTime.month}/${_currentTime.year}')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: imgData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => navigating[index]));
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => navigating[5],));
                          },
                          child: Container(
                            height: 250,
                            // width: MediaQuery.of(context).size.width * 2,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  )
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  imgData[index],
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      // fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'More Information',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Image.asset('assets/images/sale_survey.png')),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
