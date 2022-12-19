import 'dart:async';
import 'package:firebase/firebaselogic_class/firebase_calss.dart';
import 'package:firebase/firebaselogic_class/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;


class splesh_screen extends StatefulWidget {
  const splesh_screen({Key? key}) : super(key: key);

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  bool msg = false;

  @override
  void initState() {
    super.initState();
    msg = checkUser();
    fireNotificationReg();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),
        () => msg ? Get.offNamed('hm') : Get.offNamed('lg'));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              FlutterLogo(
                size: 150,
              ),
            ],
          ),

        ),
      ),
    );
  }
}
