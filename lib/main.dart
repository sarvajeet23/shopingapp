import 'package:flutter/material.dart';
import 'package:shopingapp/auth/customer_singup.dart';
import 'package:shopingapp/main_screens/customer_home.dart';
import 'package:shopingapp/main_screens/suppilier_home.dart';
import 'package:shopingapp/main_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyBUIIbi1X6XFbHxaRjoyjAyeuOooePvah8',
    appId: '1:276741620854:android:d000f8c1763322ec46cb57',
    messagingSenderId: '276741620854',
    projectId: 'multi-store-2d6f6',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/coustomer_home': (context) => const CustomerHomeScreen(),
        '/supplier_home': (context) => const SupplierHomeScreen(),
        '/customer_sigup': (context) => const CustomerRegister()
      },
    );
  }
}
