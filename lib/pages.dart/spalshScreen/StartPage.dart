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
                color: Colors.black,
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
      child: Image.asset('assets/logo.png'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/02.jpg'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
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
        Positioned(
          bottom: size.height * 0.1,
          left: size.width * 0.35,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Next Page'),
          ),
        ),
      ],
    );
  }
}
