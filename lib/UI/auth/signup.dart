import 'package:my_balemoya_app/UI/auth/login.dart';
import 'package:my_balemoya_app/UI/search/widgets/custom_field.dart';

import 'package:my_balemoya_app/constants/app_constants.dart';
import 'package:my_balemoya_app/controllers/exports.dart';

import 'package:my_balemoya_app/common/app_style.dart';

import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/reusable_text.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_balemoya_app/data/mock_service.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController profession = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    confirmpassword.dispose();
    password.dispose();
    profession.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double headersize;
    double toolbarheight;
    double signupwidth;
    double signupheight;
    double pagepadding;
    double sWidth = MediaQuery.of(context).size.width;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.shortestSide <= 500;
    Orientation orientaion = MediaQuery.of(context).orientation;
    if (isMobile(context)) {
      if (orientaion == Orientation.portrait) {
        headersize = 20;
        toolbarheight = 55.h;
        signupwidth = 400;
        pagepadding = 10;
        signupheight = 60;
      } else {
        toolbarheight = 75.h;
        headersize = 13;
        signupwidth = 300;
        pagepadding = 100;
        signupheight = 80;
        toolbarheight = 75.h;
      }
    } else {
      if (orientaion == Orientation.portrait) {
        headersize = 20;
        signupwidth = 300;
        pagepadding = 90;
        signupheight = 60;
        toolbarheight = 65.h;
      } else {
        toolbarheight = 65.h;
        headersize = 15;
        signupwidth = 400;
        pagepadding = 100;
        signupheight = 60;
      }
    }
    return Consumer<SignUpNotifier>(
      builder: (context, SignUpNotifier, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarHeight: toolbarheight,
            centerTitle: true,
            title: Text(
              "signup".tr,
              style: appstyle(headersize, Colors.black, FontWeight.normal),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: pagepadding),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const HeightSpacer(size: 20),
                  Column(
                    children: [
                      Text(
                        "register".tr,
                        textAlign: TextAlign.center,
                        style: appstyle(
                            headersize, Color(kDark.value), FontWeight.normal),
                      ),
                      const HeightSpacer(size: 5),
                      const SizedBox(
                        width: 90,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                      ),
                    ],
                  ),
                  const HeightSpacer(size: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: CustomField(
                            hintText: "fullname".tr,
                            keyboard: TextInputType.name,
                            controller: name,
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "please enter a valid name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      const WidthSpacer(size: 10),
                      Expanded(
                        child: Container(
                          child: CustomField(
                            hintText: "email".tr,
                            keyboard: TextInputType.name,
                            controller: email,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "please enter a valid email";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const HeightSpacer(size: 20),
                  CustomField(
                    hintText: "mobilenumber".tr,
                    keyboard: TextInputType.name,
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
                    hintText: "selectprofession".tr,
                    keyboard: TextInputType.emailAddress,
                    controller: profession,
                    validator: (profession) {
                      if (profession!.isEmpty) {
                        return "please enter a valid profession";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomField(
                    hintText: "password".tr,
                    obscureText: SignUpNotifier.isObsecure,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        SignUpNotifier.isObsecure = !SignUpNotifier.isObsecure;
                      },
                      child: Icon(
                        SignUpNotifier.isObsecure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      ),
                    ),
                    keyboard: TextInputType.text,
                    controller: password,
                    validator: (password) {
                      if (SignUpNotifier.passwordValidator(password ?? '')) {
                        return "please enter valid passowrd with one speacial character,one upper case and one lowercase";
                      }
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomField(
                    hintText: "confirmpassword".tr,
                    obscureText: SignUpNotifier.isObsecure,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        SignUpNotifier.isObsecure = !SignUpNotifier.isObsecure;
                      },
                      child: Icon(
                        SignUpNotifier.isObsecure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(kDark.value),
                      ),
                    ),
                    keyboard: TextInputType.text,
                    controller: confirmpassword,
                    validator: (confirmpassword) {
                      return null;
                    },
                  ),
                  const HeightSpacer(size: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginPage());
                        },
                        child: ReusableText(
                            text: "login".tr,
                            style: appstyle(headersize - 3, Color(kBlue.value),
                                FontWeight.w500))),
                  ),
                  const HeightSpacer(size: 20),
                 SignUpNotifier.processing
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        // if (SignUpNotifier.validateAndSave()) {
                          SignUpNotifier.processing = true;
                          final result = await AuthService.signUp(
                            name: name.text,
                            email: email.text,
                            phone: phone.text,
                            profession: profession.text,
                            password: password.text,
                          );
                          SignUpNotifier.processing = false;

                          if (result['success']) {
                             Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
                           
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result['message'])),
                            );
                          }
                       // }
                        // {
      // Handle the case where validation fails
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Please correct the errors in the form.')),
    //   );
    // }
                      },
                      child: const Text("Sign Up"),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
