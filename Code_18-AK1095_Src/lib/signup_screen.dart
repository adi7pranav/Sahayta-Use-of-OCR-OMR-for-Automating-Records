import 'dart:ffi';

import 'package:code_18/classroom.dart';
import 'package:code_18/loginpage.dart';
import 'package:code_18/manage_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _schoolname = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("SignUp")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _email,
            decoration: InputDecoration(
              hintText: 'Email Address',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _schoolname,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'School Name',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              signUp(_email, _password, _schoolname);
            },
            child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue),
                // color: Colors.blue,
                child: Center(
                  child: Text(
                    "sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
                // color: Colors.blue,
                ),
          )
        ],
      ),
    );
  }

  signUp(TextEditingController _email, TextEditingController _password,
      TextEditingController _schoolname) async {
    print(" cane anaknasnam sasasnas\n\nn\n\n\n\n\n");
    String emailAddress = _email.text;
    String password = _password.text;
    String schoolname = _schoolname.text;
    print("email " +
        emailAddress +
        "password  " +
        password +
        "schoolname  " +
        schoolname);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      updateschoolname(schoolname);
    } on FirebaseAuthException catch (e) {
      print("catch");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void updateschoolname(String schoolname) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      print(schoolname);
      // useris = user;
      await user?.updateDisplayName(schoolname);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
}
