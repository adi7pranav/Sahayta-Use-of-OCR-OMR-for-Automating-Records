import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddClass extends StatefulWidget {
  String? schoolname;
  AddClass({Key? key, this.schoolname}) : super(key: key);

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _classname = TextEditingController();
    // TextEditingController _password = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("add class")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _classname,
            decoration: InputDecoration(
              hintText: 'class name',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // TextField(
          //   controller: _password,
          //   decoration: InputDecoration(
          //     hintText: 'Password',
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              addclass(widget.schoolname, _classname);
              _classname.clear();
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
                    "Add class",
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

  void addclass(String? schoolname, TextEditingController classname) {
    print(schoolname);
    print(classname.text);
    FirebaseFirestore db = FirebaseFirestore.instance;
    final nothing = <String, String>{};

    db.collection(schoolname!).doc(classname.text).set(nothing);
    print("sucessfulyy added");
    Fluttertoast.showToast(
        msg: "class added sucessfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Color.fromARGB(255, 7, 7, 7),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
