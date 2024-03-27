import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbc_app/model/customer_model/costumer_model.dart';
import 'package:sbc_app/model/sale_survey_no_mvvm/sale_survey_model.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/Custumer_page.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/widget/customer_detail.dart';
import 'package:sbc_app/view/Costumer/no_mvvm/widget/update_no_mvvm.dart';
import 'package:sbc_app/view/auth/login_page.dart';
import 'package:sbc_app/view/home_page.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/view/sales_surveys/no_mvvm/widget/sale_detail.dart';
import 'package:sbc_app/viewmodel/auth_viewmodel/auth_viewmodels.dart';

import 'view/sales_surveys/no_mvvm/widget/add_sales_no_mvvm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => LoginPage(),
          '/bottinNavigationBar': (context) => BottinNavigationBar(),
          '/saleDeta': (BuildContext context) => new SaleDetail(saleModel: SaleModel(), onUpdate: () {  },),
          '/customerDetail': (BuildContext context) => new CustomerDetail(customerModel: CustomerModel(), onUpdate: () {  },),
          '/updateCustomer': (BuildContext context) => new NoMvvmUpdateCustomer(customerModel: CustomerModel(), onUpdate: (updatedCustomerModel) {

          },),
        },
      ),
    );
  }
}

