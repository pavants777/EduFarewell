import 'package:clc/routes/routes.dart';
import 'package:clc/widgets/splashScreenWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageStart extends StatelessWidget {
  const HomePageStart({super.key});

  @override
  Widget build(BuildContext context) {
    void navigatonChange() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }

    Future.delayed(Duration(seconds: 3), navigatonChange);

    return Container(
      color: Theme.of(context).colorScheme.primary,
      width: double.infinity,
      height: double.infinity,
      child: CompanyLog(double.infinity, double.infinity),
    );
    ;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomePage',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.startPage, (route) => false);
              },
              child: Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
