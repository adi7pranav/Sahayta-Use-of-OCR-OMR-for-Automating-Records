import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ManageUser extends StatefulWidget {
  const ManageUser({
    Key? key,
  }) : super(key: key);

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  @override
  Widget build(BuildContext context) {
    Future<User?> useris;
    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: (Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              child: Container(
                color: Colors.pink,
                height: 45,
                width: 120,
                child: Text("createuser"),
              ),
              onTap: () {
                signUp();
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: GestureDetector(
              child: Container(
                color: Colors.pink,
                height: 45,
                width: 120,
                child: Text("login"),
              ),
              onTap: () {
                logIn();
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              child: Container(
                color: Colors.pink,
                height: 45,
                width: 120,
                child: Text("getuser id"),
              ),
              onTap: () {
                getUserId();
              },
            ),
          ),
          Center(
            child: GestureDetector(
              child: Container(
                color: Colors.pink,
                height: 45,
                width: 120,
                child: Text("add to dataase"),
              ),
              onTap: () {
                addTodatabase();
              },
            ),
          ),
        ],
      )),
    );
  }

  signUp() async {
    String emailAddress = "lokeshloki6363@gmail.com";
    String password = "Loki@2107";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logIn() async {
    String emailAddress = "lokeshloki6363@gmail.com";
    String password = "Loki@2107";
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print("\nsiggned nin succesufilly");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  getUserId() async {
    // User? useris;
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      // useris = user;
      await user?.updateDisplayName("Saraswathi school");

      if (user != null) {
        for (final providerProfile in user.providerData) {
          // ID of the provider (google.com, apple.cpm, etc.)
          final provider = providerProfile.providerId;

          // UID specific to the provider
          final uid = providerProfile.uid;

          // Name, email address, and profile photo URL
          final name = providerProfile.displayName;
          final emailAddress = providerProfile.email;
          final profilePhoto = providerProfile.photoURL;

          print(provider);
          print(uid);
          print(emailAddress);
          print(name);
        }
      }
    });
    // return useris;
  }

  void addTodatabase() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final city = <String, String>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA"
    };

    db
        .collection("cities")
        .doc("LA")
        .set(city)
        .onError((e, _) => print("Error writing document: $e"));
  }
}
