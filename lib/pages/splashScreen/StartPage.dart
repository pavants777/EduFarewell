import 'package:clc/Services/auth_Services.dart';
import 'package:clc/pages/splashScreen/SignUp.dart';
import 'package:clc/widgets/splashScreenWidgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  PageController _controller = PageController(initialPage: 0);

  int activePage = 0;

  List<Widget> _page = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemCount: _page.length,
            itemBuilder: (context, int index) {
              return _page[index % _page.length];
            },
          ),
          Positioned(
            bottom: size.height * 0.05,
            left: size.width * 0.4,
            child: DotsIndicator(
              dotsCount: _page.length,
              position: activePage,
              decorator: DotsDecorator(
                color: Theme.of(context).colorScheme.secondary,
                activeColor: Theme.of(context).colorScheme.secondary,
                size: Size.square(9),
                activeSize: Size(27.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CompanyLog(double.infinity, double.infinity),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CompanyLog(150.0, 150.0),
            SizedBox(
              height: 10,
            ),
            TextLine("Student LogIn", 30, context),
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
              print('Button Tap');
              _auth.login(context, _email.text, _password.text);
            }, "LOGIN", context),
            SizedBox(
              height: 30,
            ),
            UseSignIn("Don't have account ?", "  Register", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
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

class Page3 extends StatelessWidget {
  Page3({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CompanyLog(150.0, 150.0),
          SizedBox(
            height: 10,
          ),
          TextLine("College LogIn", 30, context),
          SizedBox(
            height: 30,
          ),
          customTextField(_email, "College Email", Icon(Icons.email), context),
          SizedBox(
            height: 30,
          ),
          customTextField(_password, "Password", Icon(Icons.key), context,
              isTrue: true),
          SizedBox(
            height: 30,
          ),
          customButton(() {}, "LOGIN", context),
          SizedBox(
            height: 30,
          ),
          UseSignIn("Don't have account ?", "  Register", () {}, context),
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
    );
  }
}
