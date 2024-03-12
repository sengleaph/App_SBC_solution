import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbc_app/repository/auth_repo/auth_repository.dart';
import 'package:sbc_app/view/auth/login_page.dart';
import 'package:sbc_app/view/navigation_bar/navigation_bar.dart';
import 'package:sbc_app/viewmodel/auth_viewmodel/auth_viewmodels.dart';

import 'data/network/api_service.dart';

// GetIt getIt = GetIt.instance;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              AuthViewModel())

      ],
      child: MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => LoginPage(),
          '/bottinNavigationBar': (context) => BottinNavigationBar()
        },
      ),
    );
  }
}
