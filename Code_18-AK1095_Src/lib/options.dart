import 'package:code_18/selectsubject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OptionsforClass extends StatefulWidget {
  String schoolName, className;
  OptionsforClass({Key? key, required this.schoolName, required this.className})
      : super(key: key);

  @override
  State<OptionsforClass> createState() => _OptionsforClassState();
}

class _OptionsforClassState extends State<OptionsforClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.className),
      ),
      body: Column(
        children: [
          Container(
            height: 75,
          ),
          GestureDetector(
            child: Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 124, 221, 127)),
              child: Center(
                  child: Text(
                "Marks",
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SelectSubject(
                        cname: widget.className, sname: widget.schoolName)),
              );
            },
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            child: Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 124, 221, 127)),
              child: Center(
                  child: Text(
                "Attendance",
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => Attendance(obj: widget.obj)),
              // );
            },
          )
        ],
      ),
    );
  }
}
