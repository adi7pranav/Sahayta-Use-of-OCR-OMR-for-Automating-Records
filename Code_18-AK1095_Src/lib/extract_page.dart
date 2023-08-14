import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ExtractData extends StatefulWidget {
  String cname, sname, sub;
  ExtractData(
      {Key? key, required this.cname, required this.sname, required this.sub})
      : super(key: key);

  @override
  State<ExtractData> createState() => _ExtractDataState();
}

class _ExtractDataState extends State<ExtractData> {
  var marks = new List.filled(14, 0, growable: false);
  File? _image;
  RecognizedText? _extractedData;

  Future getImage({required source}) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
      processdata(imageTemporary.path);

      // final inputImage = InputImage.fromFilePath(image.path);
      // processdata(inputimage: inputImage);
    });
  }

  Future processdata(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    _extractedData = recognizedText;
    print("number ofblocks\n\n\n\n");
    print(recognizedText.blocks.length);
    // if (recognizedText.blocks.length == 30) {
    //   _flag = 1;
    // }

    // print("\n\n\n\n\n\n\n\n\n\n\n\nn\dfsfsfsdfdsfdsfsd\n\n");
    // print(recognizedText.text);
    print("output\n\n\n");
    // print("\n\n\n\n\n\n\n\n\n\n\n\nn\dfsfsfsdfdsfdsfsdblock\n\n");
    // print(recognizedText.blocks.length);
    for (TextBlock block in recognizedText.blocks) {
      print(block.text);
      // final Rect rect = block.rect;
      // final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      // print(twoDList);
      // print(text);
      // print("nw\n");
      // final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.sub),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Image.network('https://picsum.photos/250?image=9'),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  title: 'Pick from Gallery',
                  icon: Icons.image_outlined,
                  onClick: () {
                    getImage(source: ImageSource.gallery);
                  }),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                  title: 'Pick from Camera',
                  icon: Icons.camera,
                  onClick: () {
                    getImage(source: ImageSource.camera);
                  }),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                  title: 'Process Data',
                  icon: Icons.computer,
                  onClick: () {
                    processdata1();
                  }),
            ],
          ),
        ));
  }

  void processdata1() {
    var k = 0;
    int temp = 0, temp1 = 0;

    print(_extractedData!.text);
    for (int x = 16; x < 30; x++) {
      // print(_extractedData?.blocks[x].text);
      try {
        temp = int.parse(_extractedData!.blocks[x].text[0]);
        temp1 = int.parse(_extractedData!.blocks[x].text[1]);
      } catch (e) {
        print(x);
        print(e);
      }
      int res = temp * 10 + temp1;
      marks[k++] = res;
    }
    print(marks);
    print(widget.sub);
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ],
      ),
    ),
  );
}
