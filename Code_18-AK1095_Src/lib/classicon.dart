import 'package:code_18/options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Classicon extends StatelessWidget {
  String sname, cname;
  Classicon({Key? key, required this.sname, required this.cname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                  cname,
                  style: TextStyle(fontSize: 32),
                )),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OptionsforClass(schoolName: sname, className: cname)),
                );
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
