import 'dart:developer';
import 'dart:io';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class ModelInfo {
  final String label;
  final String title;
  final String description;

  ModelInfo(this.label, this.title, this.description);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
List<ModelInfo> models = [
  ModelInfo("0 Railway to Dagupan. Bayambang, Pangasinan", "Railway to Dagupan - Bayambang", "Railway to Dagupan. Bayambang, Pangasinan. 1907"),
  ModelInfo("1 Diploma", "Diploma", "A sample diploma issued by BHS (now BNHS) 1953"),
  ModelInfo("2 Balintawak and alampay", "Balintawak and Alampay", "Balintawak, a native butterfly-sleeved blouse and accompanying Alampay (shawl) worn by Mrs. Manganaan during formal occasions." ),
  ModelInfo("3 Woman of Hope", "Woman of Hope", "A story of a child/woman in search of her destiny to the world"),
  ModelInfo("4 Captured", "Captured", "A story of a productive woman whose heart was captured by unknown, still searching for freedom despite the loneliness of pursuing her dreams"),
  ModelInfo("5 Behind the Golden Smile", "Behind the Golden Smile", "A story of a woman who was a victim of violence, yet remains optimistic. This serves as a message of encouragement to stop violence against woman"),
  ModelInfo("6 Empowered Woman", "Empowered Woman", "A woman depicting empowerment and freedom through her body painting"),
  ModelInfo("7 The Great Thinker", "The Great Thinker", "Inspired from a learner who always thinks and recites the correct answer every time the teacher asks questions"),
  ModelInfo("8 Lady Farmer #2", "Lady Farmer #2", "The painting portrays the importance and beauty of farming represented by a mysterious lady. Support farmers."),
  ModelInfo("9 Tahanan","Tahanan", "The greatest gift we receive in the beginning of our lives is having a mother who cares for us unconditionally for the rest of her live. "),
  ModelInfo("10 Butil ng Buhay", "Butil ng Buhay", "This painting is inspired by the works of Fernando Amorsolo (National Artist), and it portrays farmers doing their best to supply food to the world. We must respect their sacrifices"),
  ModelInfo("11 Basket Ladies", "Basket Ladies", "Inspired  by famous Filipino Artist. Anita Magsaysay-Ho, who brought the Philippine Art in the modern world by portraying the basket ladies as different in the society."),
  ModelInfo("12 Lady Farmer #1", "Lady Farmer #1", "Description of 12 Lady Farmer #1"),
  ModelInfo("13 The Buro Maker", "The Buro Maker", "Description of"),
  ModelInfo("14 Magasin", "Magasin", "Description of"),
  ModelInfo("15 Nanay ko si Darna", "Nanay ko si Darna", "Description of"),
  ModelInfo("16 The Naked Woman", "The Naked Woman", "Description of"),
  ModelInfo("17 Value", "Value", "Description of"),
  ModelInfo("18 Purity and Power", "Purity and Power", "Description of"),
  ModelInfo("19 The Hidden Gem", "The Hidden Gem", "Description of"),
  ModelInfo("20 Van Gogh's Daughter", "Van Gogh's Daughter", "Description of"),
  ModelInfo("21 Mother's Love", "Mother's Love", "Description of"),
  ModelInfo("22 The Albinos", "The Albinos", "Description of"),
  ModelInfo("23 Lady in the Black Box", "Lady in the Black Box", "Description of"),
  ModelInfo("24 Prisma Woman", "Prisma Woman", "Description of"),
  ModelInfo("25 Bayambang's Finest", "Bayambang's Finest", "Description of"),
  ModelInfo("26 Baile", "Baile", "Description of"),
  ModelInfo("27 Bayambanguena", "Bayambanguena", "Description of"),
  ModelInfo("28 Pamilya Bayambangueno", "Pamilya Bayambangueno", "Description of"),
  ModelInfo("29 The 11th Cinemanila International Film Festival", "TThe 11th Cinemanila International Film Festival", "Description of"),
  ModelInfo("30 Jars", "Jars", "Description of"),
  ModelInfo("31 A Young Girl drinks from a Buyog with a Faucet", "A Young Girl drinks from a Buyog with a Faucet", "Description of"),
  ModelInfo("32 Mortar (Lasong in Pangasinan)", "Mortar (Lasong in Pangasinan)", "Description of"),
  ModelInfo("33 Canteen Set", "Canteen Set", "Description of"),
  ModelInfo("34 Scarecrow, Grinder, Sled, and Alo", "Scarecrow, Grinder, Sled, and Alo", "Description of"),
  ModelInfo("35 Bayambang: Onion Capital of the Philippines", "Bayambang: Onion Capital of the Philippines", "Description of"),
  ModelInfo("36 Pagey, Belas, Niluto", "Pagey, Belas, Niluto", "Description of"),
  ModelInfo("37 Gasera Lamp", "Gasera Lamp", "Description of"),
  ModelInfo("38 Lamps (Hasag in Pangasinan)", "Lamps (Hasag in Pangasinan)", "Description of"),
  ModelInfo("39 Bolo Knife", "Bolo Knife", "Description of"),
  ModelInfo("40 Fish Catching and Silew na Patang", "Fish Catching and Silew na Patang", "Description of"),
  ModelInfo("41 Camesa de Chino", "Camesa de Chino", "Description of"),
  ModelInfo("42 Maria Clara Dress", "Maria Clara Dress", "Description of"),
  ModelInfo("43 Balintawak and Tapis", "Balintawak and Tapis", "Description of"),
  ModelInfo("44 Corn Farming in Bayambang", "Corn Farming in Bayambang", "Description of"),
  ModelInfo("45 Pogi", "Pogiiii", "Pinaka-pogi sa buong Solar System"),

  // Add more labels and descriptions here as needed
];

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  TfliteModelState createState() => TfliteModelState();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////

class TfliteModelState extends State<TfliteModel> {
  late File image;
  late List results;
  bool imageSelect = false;
  List<String> labels = []; ///////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    loadModel();
    loadLabels();
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
  Future loadLabels() async {
    final labelFile = await rootBundle.loadString('assets/labels.txt');
    labels = labelFile.split('\n');
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
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    for (int index = 0; index < results.length; index++) {
      String label = results[index]['label'];
      String description = getDescriptionForLabel(label);
      log('$label - $description');
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    showMyDialog(image: image, results: results);
  }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  String getDescriptionForLabel(String label) {
    // Find the index of the label in the labels list and return the corresponding description
    for (int index = 0; index < labels.length; index++) {
      if (labels[index] == label) {
        if (index < models.length) {
          return "Title: ${models[index].title}\nDescription: ${models[index].description} ";
        } else {
          return "Description not found";
        }
      }
    }
    return "Description not found";
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

  Future<void> showMyDialog( {required File image, required List results}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(image))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      String label = results[index]['label'];
                      String description = getDescriptionForLabel(label);
                      return Card(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            (results[index]['confidence']) >= 0.80
                                ? "${description}"
                                : "Error",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),


          actions: <Widget>[
            Center(
              child: Container(
                width: 100, // Adjust the width as needed
                decoration: BoxDecoration(
                  color: Colors.blue, // Change the background color
                  borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                ),
                child: TextButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white, // Change the text color
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // This will close the dialog
                  },
                ),
              ),
            ),
          ],
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
        title: const Text("Image Recognition"),
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
            width: MediaQuery.of(context).size.width * 0.1,
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


/////////////////////////////////////////////////////////////////////////////


