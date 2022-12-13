
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teste/pages/auth_page.dart';
import 'package:teste/pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: navigatorKey,

      title: 'Teste',
      theme: ThemeData(
      textTheme: GoogleFonts.oswaldTextTheme(
        Theme.of(context).textTheme
      ),
      colorSchemeSeed: Colors.green,
      brightness: Brightness.dark,
     ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:(context, snapshot){
        if (snapshot.hasData) {
          return HomePage();
        } else{
          return AuthPage();
        }
      }
    )
  );
}