import 'package:my_balemoya_app/constants/app_constants.dart';

import 'package:flutter/material.dart';

class NavigationShow extends StatelessWidget {
  const NavigationShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Color(kLightGrey.value))),
        // ignore: prefer_const_constructors
        title: Text("Navigating"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 600,
            child: Image.asset(
              "assets/images/navigation.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
