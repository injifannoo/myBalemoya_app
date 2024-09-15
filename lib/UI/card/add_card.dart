import 'package:my_balemoya_app/common/exports.dart';
import 'package:my_balemoya_app/common/height_spacer.dart';
import 'package:my_balemoya_app/common/width_spacer.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Itu/screen/payment_screen.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 240, 238, 238),
      appBar: AppBar(
        title: ReusableText(
            text: "Payment Methods",
            style: appstyle(16, Color(kDark.value), FontWeight.w400)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeightSpacer(size: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 246, 246),
              border: Border(
                bottom:
                    BorderSide(color: Color(kDarkGrey.value).withOpacity(0.6)),
              ),
            ),
            child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(const AddCard());
                            },
                            icon: Icon(
                              Icons.add_circle,
                              size: 35,
                              color: Color(kOrange.value),
                            )),
                        const WidthSpacer(size: 10),
                        Column(
                          children: [
                            ReusableText(
                              text: "Add New Card",
                              style: appstyle(
                                  17, Color(kDark.value), FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 15),
                ReusableText(
                  text: "Credit cards",
                  style: appstyle(18, Color(kDark.value), FontWeight.normal),
                ),
                const HeightSpacer(size: 10),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 246, 246),
                    border: BorderDirectional(
                      bottom: BorderSide(
                        color: Color(kDarkGrey.value).withOpacity(0.6),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(kBlue.value),
                            backgroundImage:
                                const AssetImage("assets/images/visa.jpg"),
                          ),
                          const WidthSpacer(size: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                text: "********* 4739 749 ",
                                style: appstyle(
                                    17, Color(kDark.value), FontWeight.normal),
                              ),
                              ReusableText(
                                  text: "VISA Card",
                                  style: appstyle(14, Color(kDarkGrey.value),
                                      FontWeight.w300)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const HeightSpacer(size: 10),
                GestureDetector(
                   onTap: () {
                    // Navigate to payment_screen.dart when Chapa is selected
                    Get.to(const PaymentScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 246, 246),
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Color(kDarkGrey.value).withOpacity(0.6),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(kBlue.value),
                              backgroundImage:
                                  const AssetImage("assets/images/chapa.png"),
                            ),
                            const WidthSpacer(size: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  text: "********* 4739 749 ",
                                  style: appstyle(
                                      17, Color(kDark.value), FontWeight.normal),
                                ),
                                ReusableText(
                                    text: "Chapa Payment Service",
                                    style: appstyle(14, Color(kDarkGrey.value),
                                        FontWeight.w300)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
