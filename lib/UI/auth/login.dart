import 'package:my_balemoya_app/UI/auth/forgot_password.dart';
import 'package:my_balemoya_app/UI/auth/signup.dart';
import 'package:my_balemoya_app/UI/search/widgets/custom_field.dart';

import 'package:my_balemoya_app/controllers/exports.dart';


import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_balemoya_app/data/mock_service.dart';
import 'package:provider/provider.dart';

import '../homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double headersize;
    double loginwidth;
    double loginheight;
    double pagepadding;
    double toolbarheight;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 20;
        loginwidth = 400;
        toolbarheight = 55.h;
        pagepadding = 10;
        loginheight = 60;
      } else {
        loginheight = 80;
        toolbarheight = 85.h;
        headersize = 11;
        loginwidth = 300;
        pagepadding = 200;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 20;
        loginheight = 60;
        loginwidth = 300;
        pagepadding = 90;
        toolbarheight = 55.h;
      } else {
        toolbarheight = 75.h;
        headersize = 15;
        loginwidth = 300;
        loginheight = 60;
        pagepadding = 200;
      }
    }
    return Consumer<LoginNotifier>(
      builder: (context, LoginNotifier, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarHeight: toolbarheight,
            centerTitle: true,
            title: Text(
              "login".tr,
              style: appstyle(headersize, Colors.black, FontWeight.normal),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: pagepadding),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const HeightSpacer(size: 50),
                  ReusableText(
                      text: "login".tr,
                      style: appstyle(
                          headersize + 9, Color(kBlue.value), FontWeight.w500)),
                  const HeightSpacer(size: 50),
                  CustomField(
                    hintText: "mobilenumber".tr,
                    keyboard: TextInputType.text,
                    controller: phone,
                    validator: (phone) {
                      if (phone!.isEmpty) {
                        return "please enter a valid phone";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomField(
                    hintText: "password".tr,
                    obscureText: LoginNotifier.obsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        LoginNotifier.obsecureText =
                            !LoginNotifier.obsecureText;
                      },
                      child: Icon(
                        LoginNotifier.obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      ),
                    ),
                    keyboard: TextInputType.text,
                    controller: password,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "please enter a valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const ForgotPassword());
                      },
                      child: ReusableText(
                        text: "forgotpassword".tr,
                        style: appstyle(headersize - 4, Color(kBlue.value),
                            FontWeight.w400),
                      ),
                    ),
                  ),
                  const HeightSpacer(size: 30),
                
                  ElevatedButton(
                    onPressed: () async {
                      final result = await AuthService.loginUser(
                        phone: phone.text,
                        password: password.text,
                      );

                      if (result['success']) {
                          Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
  );
                           
                          
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(result['message'])),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                  const HeightSpacer(size: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReusableText(
                        text: "notmember".tr,
                        style: appstyle(headersize - 4, Color(kDarkGrey.value),
                            FontWeight.w400),
                      ),
                      const WidthSpacer(size: 15),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegistrationPage());
                        },
                        child: ReusableText(
                          text: "signup".tr,
                          style: appstyle(headersize - 3, Color(kOrange.value),
                              FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
