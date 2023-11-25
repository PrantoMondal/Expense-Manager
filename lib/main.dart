import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/pages/bottom_nav.dart';
import 'package:expense_manager/pages/dashboard_page.dart';
import 'package:expense_manager/pages/splash_screen.dart';
import 'package:expense_manager/pages/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/sign_up.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginPage.routeName: (_) => LoginPage(),
        RegistrationScreen.routeName: (_) => RegistrationScreen(),
        DashboardScreen.routeName: (_) => DashboardScreen(),
        ExBottomAppBar.routeName: (_) => ExBottomAppBar(),
        StatisticsScreen.routeName: (_) => StatisticsScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
