import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: Variable.login,
        child: SafeArea(
          //top: true,
          minimum: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Spacer(),
                SizedBox(
                  height: h / 6,
                ),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  "Please enter your details\n",
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "User Name",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: Variable.userName,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter this details';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        Variable.user_name = val;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff777777),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff777777),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    controller: Variable.password,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter this details';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        Variable.pswd = val;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff777777),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff777777),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xFFFF8D44),
                      value: Variable.rememberMe,
                      splashRadius: 0,
                      onChanged: (val) async {
                        setState(() {
                          Variable.rememberMe = val!;
                        });
                      },
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                        color: Color(0xff777777),
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff777777),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      if (Variable.login.currentState!.validate()) {
                        Variable.login.currentState!.save();
                        Navigator.of(context).pushReplacementNamed("home");
                        prefs.setBool('remember', Variable.rememberMe);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: h / 16,
                    width: w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFF8D44),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "LOGIN ACCOUNT",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                //Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
