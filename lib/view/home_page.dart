import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sbc_app/view/Costumer/Custumer_page.dart';
import 'package:sbc_app/view/attendance/attendence_page.dart';
import 'package:sbc_app/view/history/history_page.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/view/profile_page/profile_page.dart';
import 'package:sbc_app/view/time_leave/time_leave_page.dart';
import 'package:sbc_app/view/widget/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  var height, width;

  List imgData = [
    "assets/images/attendance.png",
    "assets/images/time_leave.png",
    "assets/images/day_off.png",
    "assets/images/customer.png",
    "assets/images/sale_servey.png",
    "assets/images/salary.png",
  ];

  List titles = [
    "Attendance",
    "Time Leave",
    "Day Off",
    "Customer",
    "Sales Survey",
    "Salary",
  ];
  List navigating = [
    AttendencePage(),
    TimeLeavePage(),
    AttendencePage(),
    CustumerPage(),
    AttendencePage(),
    TimeLeavePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.green.shade900,
        ),
        backgroundColor: Colors.green.shade900,
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
            Text('SBC Solution'),
          ],
        ),
      ),
      drawer: MyDraw(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, right: 20, bottom: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage ('assets/images/placeholder.png'),
                  ),
                  Text('Seang Sengleaph'),
                  Spacer(),
                  Text('3/3/2023')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: imgData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => navigating[index]));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => navigating[5],));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                        children: [
                          Image.asset(
                            imgData[index],
                            width: 100,
                          ),
                          Text(
                            titles[index],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

      //=======================================================================
      // add to every page?
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.green.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.history, size: 30, color: Colors.white,),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(),
                      ));
                }),
            // IconButton(icon: Icon(Icons.home_filled), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.person, size: 30, color: Colors.white,),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ));
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(Icons.home_filled,size: 30, color: Colors.green.shade900,),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
