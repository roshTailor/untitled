import 'package:flutter/material.dart';

class Variable {
  static TextEditingController userName = TextEditingController();
  static String user_name = '';
  static TextEditingController password = TextEditingController();
  static String pswd = '';
  static GlobalKey<FormState> login = GlobalKey<FormState>();
  static bool rememberMe = false;
}
