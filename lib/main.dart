import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'IntroScreen.dart';
import 'homePage.dart';
import 'loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: "Ubuntu",
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: (prefs.getBool('introEnd') == true)
          ? (prefs.getBool('remember') == true)
              ? 'home'
              : 'login'
          : '/',
      routes: {
        '/': (context) => const BrowserIntro(),
        'home': (context) => const HomePage(),
        'login': (context) => const Loginpage(),
      },
    ),
  );
}
