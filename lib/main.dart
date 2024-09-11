import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jlb_foods/firebase_options.dart';
import 'package:jlb_foods/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'services/auth/auth_gate.dart';
import 'themes/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      // const LoginOrRegister(),
      // const MyHomePage(title: 'Food Delivery App'),
    );
  }
}
