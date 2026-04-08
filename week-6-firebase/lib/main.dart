import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase/screens/home.dart';
import 'package:firebase/screens/login.dart';
import 'package:firebase/screens/register.dart';

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
// Login Version
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: 'login', routes: {
      'home': (context) => const HomeScreen(),
      'login': (context) => const LoginScreen(),
      'register': (context) => const RegisterScreen(),
    });
  }
// Non Login Version
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: HomePage(),
  //   );
  // }
}