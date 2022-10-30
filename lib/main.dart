import 'package:flutter/material.dart';
import 'package:insurance_app/src/pages/dashboard/dashboard_page.dart';
import 'package:insurance_app/src/pages/login/login_page.dart';
import 'package:insurance_app/src/pages/profile/cliente_profile_page.dart';
import 'package:insurance_app/src/pages/profile/profile_menu.dart';
import 'package:insurance_app/src/providers/AuthProvider.dart';
import 'package:insurance_app/src/providers/PolizaProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PolizaProvider>(
                  create: (context) => PolizaProvider(authProvider))
            ],
            child: MaterialApp(
              title: 'SeguroMotors',
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) {
                  final authProvider = Provider.of<AuthProvider>(context);
                  if (authProvider.isAuthenticated) {
                    return DashboardPage();
                  } else {
                    return LoginPage();
                  }
                },
                'login':(BuildContext context)=>
                    LoginPage(),
                'dashboard':(BuildContext context)=>
                    DashboardPage(),
                'profile':(BuildContext context)=>
                    ClienteProfilePage()
              },
            ),
          );
        },
      ),
    );
  }
}

