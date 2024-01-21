import 'dart:async';

import 'package:clc/Provider/User_provider.dart';
import 'package:clc/pages/splashScreen/StartPage.dart';
import 'package:clc/routes/routes.dart';
import 'package:clc/widgets/splashScreenWidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageStart extends StatelessWidget {
  const HomePageStart({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CompanyLog(double.infinity, double.infinity),
            ),
          );
        } else {
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          if (userProvider.user.token == null ||
              userProvider.user.token!.isEmpty) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StartPage()),
              );
            });
          } else {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            });
          }
          return Scaffold(
            body: Center(child: Text('Hello World')),
          );
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_user.email}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              '${_user.id}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              '${_user.token}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
