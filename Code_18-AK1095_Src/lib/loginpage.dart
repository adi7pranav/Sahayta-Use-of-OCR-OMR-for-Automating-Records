import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_18/manage_user.dart';
import 'package:code_18/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'classroom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      // appBar: AppBar(title: Text("Login")),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Sahayta",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email Address',
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  logIn(_email, _password);
                  getschoolname();
                  // String schname = await name;
                  // print("demo is schname" + schname);
                  // print("School name is " + name.toString());
                },
                child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.purple),
                    // color: Colors.blue,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )
                    // color: Colors.blue,
                    ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                  child: Text(
                    "Don't have account? Register Now",
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logIn(
      TextEditingController email, TextEditingController passwords) async {
    String name = "Lokesh";
    FirebaseFirestore db = FirebaseFirestore.instance;
    String emailAddress = email.text;
    String password = passwords.text;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print("\nsigned in succesufully");
      // FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      //   // useris = user;

      //   // if (user != null) {
      //   //   for (final providerProfile in user.providerData) {
      //   //     name = providerProfile.displayName!;
      //   //     print("sdjhjshdlkshdkshldkjslkdhs    " + name);
      //   //   }
      //   // }
      // });
      // final docRef = db.collection(name).get().then((value) {
      //   print(name);
      //   print("size is\n\n\n\n");
      //   print(value.docs.length);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Classroom(classrooms: value)),
      // );
      // });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  getschoolname() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        for (final providerProfile in user.providerData) {
          String name = providerProfile.displayName!;
          // print("sdjhjshdlkshdkshldkjslkdhs    " + name);
          FirebaseFirestore db = FirebaseFirestore.instance;
          final docRef = db.collection(name).get().then((value) {
            print(name);
            // print("size is\n\n\n\n");
            print(value.docs.length);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Classroom(
                        classrooms: value,
                        schoolname: name,
                      )),
            );
          });
        }
      }
    });
  }
}
