import 'package:my_balemoya_app/UI/mainscreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obsecureText = true;

  Widget? _rolePage;

  bool get obsecureText => _obsecureText;
  Widget get rolePage => _rolePage!;

  set obsecureText(bool newState) {
    _obsecureText = newState;
    notifyListeners();
  }

  set rolePage(phone) {
    if (phone == "client") {
      print("client");
      _rolePage = const MainScreen();
    } else {
      _rolePage = null;
    }
  }
}
