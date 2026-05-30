import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login.controller.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/route_helper.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: controller.formstate,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: double.infinity, height: 70.h),

                    Image.asset(Images.logo, width: 100, height: 100),
                    SizedBox(height: 20),
                    Text(
                      "logIn".tr,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Your integrated medical platform',
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: "email".tr,
                      width: 290.w,
                      controller: controller.email,
                      colorFill: Colors.grey[200],
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      controller: controller.password,
                      hintText: "password".tr,
                      isPassword: true,
                      width: 290.w,
                      colorFill: Colors.grey[200],
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      buttonText: "logIn".tr,
                      width: 250,
                      color: Color(0xFF009688),
                      onPressed: () {
                        controller.login();
                        // Get.offAllNamed(RouteHelper.homePages);
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
