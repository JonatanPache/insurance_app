import 'package:flutter/material.dart';
import 'package:insurance_app/src/pages/dashboard/dashboard_page.dart';
import 'package:insurance_app/src/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'dashboard',
      routes: {
        'login':(BuildContext context)=>
            LoginPage(),
        'dashboard':(BuildContext context)=>
            DashboardPage()
      },
    );
  }
}

