import 'package:firebase/view_screen/home_screen.dart';
import 'package:firebase/view_screen/login_screen.dart';
import 'package:firebase/view_screen/ragister_screen.dart';
import 'package:firebase/view_screen/splesh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main()
async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

runApp(
  GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context)=>splesh_screen(),
      'rg':(context)=>Register_Screen(),
      'lg':(context)=>Login_screnn(),
      'hm':(context)=>HomeScreen(),
    },
  )
);
}