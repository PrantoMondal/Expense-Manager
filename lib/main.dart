import 'package:expense_manager/auth/login_page.dart';
import 'package:expense_manager/pages/add_expense.dart';
import 'package:expense_manager/pages/add_income.dart';
import 'package:expense_manager/pages/add_transection.dart';
import 'package:expense_manager/pages/bottom_nav.dart';
import 'package:expense_manager/pages/dashboard_page.dart';
import 'package:expense_manager/pages/profile.dart';
import 'package:expense_manager/pages/splash_screen.dart';
import 'package:expense_manager/pages/statistics_screen.dart';
import 'package:expense_manager/pages/wallet_screen.dart';
import 'package:expense_manager/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'auth/sign_up.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginPage.routeName: (_) => const LoginPage(),
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        DashboardScreen.routeName: (_) => const DashboardScreen(),
        ExBottomAppBar.routeName: (_) => const ExBottomAppBar(),
        StatisticsScreen.routeName: (_) => const StatisticsScreen(),
        // AddExpenseScreen.routeName: (_) => const AddExpenseScreen(),
        // AddIncomeScreen.routeName: (_) => const AddIncomeScreen(),
        AddTransactionScreen.routeName: (_) => const AddTransactionScreen(),
        // WalletScreen.routeName: (_) => const WalletScreen(),
        // ProfileScreen.routeName: (_) => const ProfileScreen(),
      },
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
