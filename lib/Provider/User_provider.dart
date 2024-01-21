import 'dart:convert';
import 'dart:async';

import 'package:clc/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(email: '', id: '', name: '', token: '', password: '');
  final StreamController<String?> _userTokenController =
      StreamController<String?>.broadcast();

  User get user => _user;

  Stream<String?> get userTokenStream => _userTokenController.stream;

  void setUser(String user) {
    Map<String, dynamic> userData = jsonDecode(user);
    _user = User.fromJson(userData);
    _userTokenController.add(_user.token);
    notifyListeners();
  }

  void setUserModel(User user) {
    _user = user;
    _userTokenController.add(_user.token);
    notifyListeners();
  }

  void dispose() {
    _userTokenController.close();
    super.dispose();
  }
}
