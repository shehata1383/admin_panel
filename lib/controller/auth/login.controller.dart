// ignore_for_file: unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // تم تعديلها إلى material لدعم الألوان والتنبيهات بشكل أفضل
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import '../../core/functions/app_usage_service.dart';
import '../../core/functions/checkInternet.dart';
import '../../core/helper/route_helper.dart';
import '../../core/model/user_model.dart';
import '../../core/widget/custom_snackbar.dart';
import '../notification/notification_controller.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  final users = FirebaseFirestore.instance.collection('users');
  late GlobalKey<FormState> formstate;
  late TextEditingController email;
  late TextEditingController password;
  LoginControllerImp();
  UserModel? model;
  final NotificationController notificationController = Get.put(
    NotificationController(),
  );

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> login() async {
    OverlayLoadingProgress.start();

    if (formstate.currentState!.validate()) {
      if (await CheckInternet.checkInternet()) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                email: email.text,
                password: password.text,
              );

          if (!userCredential.user!.emailVerified) {
            await userCredential.user!.sendEmailVerification();
          }
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
                if (documentSnapshot.exists) {
                  model = UserModel.fromJson(
                    documentSnapshot.data()! as Map<String, dynamic>,
                  );
                  AppUsageService.saveUserName(model!.userName!);
                  AppUsageService.saveUserId(userCredential.user!.uid);
                }
              });
          Get.offAndToNamed(RouteHelper.homePages);

          FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .update({'tokenDevice': notificationController.fcmToken.value})
              .then((value) => print('done'))
              .catchError((error) => print("Failed to update user: $error"));

          showCustomSnackBar("Login successful!", isError: false);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            showCustomSnackBar('No user found for that email.', isError: true);
          } else if (e.code == 'wrong-password') {
            OverlayLoadingProgress.stop();

            showCustomSnackBar(
              'Wrong password provided for that user.',
              isError: true,
            );
          }

          showCustomSnackBar("Incorrect email or password", isError: true);
        }
      } else {
        OverlayLoadingProgress.stop();

        showCustomSnackBar('Check the internet connection'.tr, isError: true);
      }
    }
    OverlayLoadingProgress.stop();
  }

  signOut() async {}

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
