import 'dart:developer';
import 'dart:io';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const Scan());
}

class Scan extends StatelessWidget {
  const Scan({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TfliteModel(),
    );
  }
}

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  TfliteModelState createState() => TfliteModelState();
}

class TfliteModelState extends State<TfliteModel> {
  late File image;
  late List results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    try {
      res = (await Tflite.loadModel(
          model: "assets/model.tflite", labels: "assets/labels.txt"))!;
      log(res);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      results = recognitions!;
      image = image;
      imageSelect = true;
    });
    log(results.length.toString());
    showMyDialog(image: image, results: results);
  }

  // Uint8List imageToByteListFloat32(
  //     img.Image image, int inputSize, double mean, double std) {
  //   var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
  //   var buffer = Float32List.view(convertedBytes.buffer);
  //   int pixelIndex = 0;
  //   for (var i = 0; i < inputSize; i++) {
  //     for (var j = 0; j < inputSize; j++) {
  //       var pixel = image.getPixel(j, i);
  //       buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
  //       buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
  //       buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
  //     }
  //   }
  //   return convertedBytes.buffer.asUint8List();
  // }

  Future<void> showMyDialog(
      {required File image, required List results}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(image))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            "${results[index]['label']} - ${results[index]['confidence'].toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('Approve'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Classification"),
      ),
      body: const SizedBox(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: pickImage,
            tooltip: "Pick Image",
            child: const Icon(Icons.image),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .04,
          ),
          FloatingActionButton(
            onPressed: pickImageFromCamera,
            tooltip: "Pick Image",
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      imageClassification(image);
    }
  }

  Future pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      imageClassification(image);
    }
  }
}
