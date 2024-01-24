import 'package:clc/pages/Profile/profile.dart';
import 'package:clc/widgets/mainScreenWidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeWidget _homeWidget = const HomeWidget();
  final SearchWidget _searchWidget = const SearchWidget();
  final MeetingWidget _meetingWidget = const MeetingWidget();

  Widget _currentPage = const HomeWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 10,
        selectedItemColor: Colors.lightGreen,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.meetup),
            label: 'Meeting',
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.person), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  int _currentIndex = 0;

  void _onItemTapped(int tappedIndex) {
    setState(() {
      _currentIndex = tappedIndex;
    });

    switch (_currentIndex) {
      case 0:
        _changePage(_homeWidget);
        break;
      case 1:
        _changePage(_searchWidget);
        break;
      case 2:
        _changePage(_meetingWidget);
        break;
      case 3:
        _changePage(ProfileWidget());
        break;
      default:
        break;
    }
  }

  void _changePage(Widget page) {
    setState(() {
      _currentPage = page;
    });
  }
}
