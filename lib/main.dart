import 'package:flutter/material.dart';
import 'package:flutter_jobs/pages/home_page.dart';
import 'package:flutter_jobs/pages/sigin_page.dart';
import 'package:flutter_jobs/pages/sigup_page.dart';
import 'package:flutter_jobs/pages/splash_page.dart';
import 'package:flutter_jobs/providers/auth_provider.dart';
import 'package:flutter_jobs/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
          '/register': (context) => SigupPage(),
          '/login': (context) => SiginPage(),
        },
      ),
    );
  }
}
