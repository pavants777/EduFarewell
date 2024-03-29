import 'dart:convert';
import 'dart:io';
import 'package:clc/Provider/User_provider.dart';
import 'package:clc/models/user.dart';
import 'package:clc/pages/homepages/homeScreen.dart';
import 'package:clc/pages/homepages/homepage.dart';
import 'package:clc/pages/splashScreen/StartPage.dart';
import 'package:clc/routes/routes.dart';
import 'package:clc/widgets/Utils.dart';
import 'package:clc/widgets/mainScreenWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      User user = User(
        email: email,
        id: '',
        name: name,
        token: '',
        password: password,
        isEmail: false,
      );

      http.Response res = await http.post(
        Uri.parse('https://clc-bakend.onrender.com/app/signup'),
        body: jsonEncode(user.toMap()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.statusCode);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          SharedPreferences preferences = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          print(userProvider.user.token);
          preferences.setString('x-auth-token', userProvider.user.token);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePageStart(),
            ),
          );
        },
      );
    } catch (e) {
      print('Error during sign-up: $e');
      GetXSnackbar('Sign-up failed. Please try again.');
    }
  }

  void login(BuildContext context, String email, password) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://clc-bakend.onrender.com/app/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.statusCode);

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          SharedPreferences preferences = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          print(userProvider.user.token);
          preferences.setString('x-auth-token', userProvider.user.token);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePageStart(),
            ),
          );
        },
      );
    } catch (e) {
      print('Error during sign-up: $e');
      GetXSnackbar('Sign-up failed. Please try again.');
    }
  }

  Future<void> getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');
      print('token : ${token}');

      if (token == null) {
        preferences.setString('x-auth-token', '');
        GetXSnackbar('Token is missing. Please log in.');
        return;
      }

      var tokenRes = await http.post(
        Uri.parse('https://clc-bakend.onrender.com/tokenIsVaild'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
      );
      var response = jsonDecode(tokenRes.body);
      print(response);
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('https://clc-bakend.onrender.com/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        userProvider.setUser(userRes.body);
      } else {
        GetXSnackbar('Token is not valid. Please log in.');
      }
    } catch (e) {
      if (e is SocketException) {
        GetXSnackbar('Network error. Please check your connection.');
      } else {
        GetXSnackbar('Error: $e');
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token', '');
    User user = User(
        email: '', id: '', name: '', token: '', password: '', isEmail: false);
    var userPrvoider = Provider.of<UserProvider>(context, listen: false);
    userPrvoider.setUserModel(user);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePageStart()),
        (route) => false);
  }

// send otp to user email
  Future<void> sendOTP(BuildContext context) async {
    var userPrvoider = Provider.of<UserProvider>(context, listen: false).user;
    var user = new User(
        email: userPrvoider.email,
        id: '',
        name: userPrvoider.name,
        token: '',
        isEmail: userPrvoider.isEmail,
        password: userPrvoider.password);
    http.Response res = await http.post(
      Uri.parse('https://clc-bakend.onrender.com/SendOTP'),
      body: jsonEncode(user.toMap()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

// verification of otp
  Future<void> verificationOfOTP(BuildContext context, String otp) async {
    var userPrvoider = Provider.of<UserProvider>(context, listen: false);
    print(otp);
    http.Response res = await http.post(
      Uri.parse('https://clc-bakend.onrender.com/verification'),
      body: jsonEncode({
        'userId': userPrvoider.user.email,
        'otp': otp,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(res.statusCode);

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () async {
        userPrvoider.verificationOfEmail();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      },
    );
  }
}
