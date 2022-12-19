import 'package:firebase/firebaselogic_class/firebase_calss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_screnn extends StatefulWidget {
  const Login_screnn({Key? key}) : super(key: key);

  @override
  State<Login_screnn> createState() => _Login_scrennState();
}

class _Login_scrennState extends State<Login_screnn> {
  TextEditingController txtemail =TextEditingController();
  TextEditingController txtepasword =TextEditingController();
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
              SizedBox(height: 20,),
              TextField(
                controller: txtepasword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter pasword",
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{
                String msg =await loginemailpassword(txtemail.text, txtepasword.text);
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${msg}")));
                if(msg == "Success")
                {
                Get.offNamed('hm');
                }
              }, child: Text("Login")),

              TextButton(
                onPressed: () async {
                  bool msg = await googleLogin();

                  if (msg) {
                    Get.offNamed('hm');
                  }
                },
                child: Text("Login With Google"),
              ),
              TextButton(onPressed: (){

                Get.toNamed('rg');
              }, child: Text("Creat a new acount")),
            ],
          ),
        ),
      ),
    );
  }
}
