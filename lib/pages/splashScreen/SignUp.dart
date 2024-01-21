import 'package:clc/Services/auth_Services.dart';
import 'package:clc/widgets/splashScreenWidgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CompanyLog(150.0, 150.0),
            SizedBox(
              height: 10,
            ),
            TextLine("Student Register", 30, context),
            SizedBox(
              height: 30,
            ),
            customTextField(_name, "UserName", Icon(Icons.person), context),
            SizedBox(
              height: 30,
            ),
            customTextField(_email, "Email", Icon(Icons.email), context),
            SizedBox(
              height: 30,
            ),
            customTextField(_password, "Password", Icon(Icons.key), context,
                isTrue: true),
            SizedBox(
              height: 30,
            ),
            customButton(() {
              print('button tap');
              _auth.signUpUser(
                  context: context,
                  email: _email.text,
                  password: _password.text,
                  name: _name.text);
              _email.clear();
              _password.clear();
              _name.clear();
            }, "SignUp", context),
            SizedBox(
              height: 30,
            ),
            UseSignIn("I have an Account ?", "  Login", () {
              Navigator.pop(context);
            }, context),
            SizedBox(
              height: 10,
            ),
            styleWidget(context),
            SizedBox(
              height: 30,
            ),
            bottomLogo(),
          ],
        ),
      ),
    );
  }
}
