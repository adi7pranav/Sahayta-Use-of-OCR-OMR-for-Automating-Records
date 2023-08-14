import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_18/addclass.dart';
import 'package:code_18/classicon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Classroom extends StatefulWidget {
  String? schoolname;
  QuerySnapshot<Map<String, dynamic>> classrooms;
  Classroom({Key? key, required this.classrooms, this.schoolname})
      : super(key: key);

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    //   // useris = user;
    //   // await user?.updateDisplayName("Saraswathi school");

    //   if (user != null) {
    //     for (final providerProfile in user.providerData) {
    //       // ID of the provider (google.com, apple.cpm, etc.)
    //       // final provider = providerProfile.providerId;

    //       // UID specific to the provider
    //       // final uid = providerProfile.uid;

    //       // Name, email address, and profile photo URL

    //       schoolname = providerProfile.displayName;

    //       // final emailAddress = providerProfile.email;
    //       // final profilePhoto = providerProfile.photoURL;

    //     }
    //   }
    //   print(
    //       "asdjaskdjsakdkasjdkasjdksajdkasjdas\n\n\n\n\n\nn\n\\nn\n\nfsfddsds\n\n\n\n\n\nn");
    //   print(schoolname);
    // });
    print("askdnkslahdlkashdlksakdlaslkdklasd\n\n\n\n\n\n\n\n\n" +
        widget.schoolname.toString());
    return Scaffold(
      appBar: AppBar(title: Text("Classroom")),
      body: ListView.builder(
          itemCount: widget.classrooms.size + 1,
          itemBuilder: (context, index) {
            if (index == widget.classrooms.size)
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddClass(
                              schoolname: widget.schoolname.toString())),
                    );
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                          child: Text(
                        "Add child",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                      height: 70,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue),
                    ),
                  ));
            return Classicon(
              cname: widget.classrooms.docs[index].id,
              sname: widget.schoolname!,
            );
          }),
    );
  }
}
