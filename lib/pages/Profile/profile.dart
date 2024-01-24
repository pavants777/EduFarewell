import 'package:clc/Provider/User_provider.dart';
import 'package:clc/Services/auth_Services.dart';
import 'package:clc/Utils/Constant.dart';
import 'package:clc/Utils/custom_button.dart';
import 'package:clc/pages/Profile/emailVerification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var _user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Column(
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 30,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.yellow,
                    child: CircleAvatar(
                      radius: 95,
                      backgroundImage: NetworkImage(Constant.image),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 35,
                      child: emailWidget(
                          Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  ?.isEmail ??
                              false,
                          context)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _user.user.name,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30),
              ),
              Text(_user.user.email,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20)),
              Text(_user.user.id,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20)),
              const SizedBox(
                height: 30,
              ),
              CustomButton("Edit Profile", FontAwesomeIcons.userPen, () {},
                  screenWidth, context),
              CustomButton("Terms and Conditions", FontAwesomeIcons.fileInvoice,
                  () {}, screenWidth, context),
              CustomButton(
                "Privacy Policy",
                FontAwesomeIcons.shieldHalved,
                () {},
                screenWidth,
                context,
              ),
              CustomButton(
                "LogOut",
                FontAwesomeIcons.signOut,
                () {
                  AuthService _auth = AuthService();
                  _auth.signOut(context);
                },
                screenWidth,
                context,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

Widget emailWidget(bool isEmail, BuildContext context) {
  if (isEmail) {
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.white),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.verified,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Email Verified",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
  return GestureDetector(
    onTap: () async {
      AuthService _auth = new AuthService();
      _auth.sendOTP(context);
      //
      // await Future.delayed(
      //   Duration(seconds: 5),
      // );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailVerficiation()),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.white),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.cancel_rounded,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Verify Email",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
