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
    Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset('assets/01.png'),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/02.jpg'),
          fit: BoxFit.contain,
        ),
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/03.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
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
                activeColor: Colors.black,
                size: Size.square(9),
                activeSize: Size(18.0, 9.0),
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

void main() {
  runApp(MaterialApp(
    home: StartPage(),
  ));
}
