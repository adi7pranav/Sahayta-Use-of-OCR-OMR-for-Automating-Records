import 'package:code_18/extract_page.dart';
import 'package:code_18/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SubjectIcon extends StatelessWidget {
  String cname, sname, sub;
  SubjectIcon(
      {Key? key, required this.cname, required this.sname, required this.sub})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                sub,
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ExtractData(cname: cname, sname: sname, sub: sub)),
              );
            },
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
