import 'package:cutree/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_user_view.dart';

class DarkModeState extends ChangeNotifier {
  bool _isDarkMode = false;

  toggle() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => DarkModeState(),
    child: const MaterialApp(
      home: MainApp(),
    ),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return IntroPage();
            } else {
              return const LoginScreen();
            }
          })),
    );
  }
}
