import 'package:code_18/subjecticon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectSubject extends StatefulWidget {
  String cname, sname;
  SelectSubject({Key? key, required this.cname, required this.sname})
      : super(key: key);

  @override
  State<SelectSubject> createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.cname)),
      body: Column(
        children: [
          SubjectIcon(
              cname: widget.cname, sname: widget.sname, sub: "Subject 1"),
          SubjectIcon(
              cname: widget.cname, sname: widget.sname, sub: "Subject 2"),
          SubjectIcon(
              cname: widget.cname, sname: widget.sname, sub: "Subject 3"),
          SubjectIcon(
              cname: widget.cname, sname: widget.sname, sub: "Subject 4"),
          SubjectIcon(
              cname: widget.cname, sname: widget.sname, sub: "Subject 5"),
          SubjectIcon(
              cname: widget.cname, sname: widget.sname, sub: "Subject 6")
        ],
      ),
    );
  }
}
