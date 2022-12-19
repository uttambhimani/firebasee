import 'package:firebase/firebaselogic_class/firebase_calss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({Key? key}) : super(key: key);

  @override
  State<Register_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Register_Screen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtepassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtepassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                ),
              ),
              ElevatedButton(onPressed: () async{
                String msg =await loginemailpassword(txtemail.text, txtepassword.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${msg}")));
                if(msg == "Success")
                {
                  Get.toNamed('hm');
                }
                singUp(txtemail.text, txtepassword.text);
              }, child: Text("SingUp")),
            ],
          ),
        ),
      ),
    );
  }
}
