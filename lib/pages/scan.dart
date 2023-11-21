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
  ModelInfo("2 Balintawak and alampay", "Balintawak and Alampay\n\nDONATED BY: Mrs. Severa Ramos Gomez Manganaan", "Balintawak, a native butterfly-sleeved blouse and accompanying Alampay (shawl) worn by Mrs. Manganaan during formal occasions." ),
  ModelInfo("3 Woman of Hope", "Woman of Hope\n\nARTIST: BENNY GILBERT M. FRIAS", "A story of a child/woman in search of her destiny to the world"),
  ModelInfo("4 Captured", "Captured", "A story of a productive woman whose heart was captured by unknown, still searching for freedom despite the loneliness of pursuing her dreams"),
  ModelInfo("5 Behind the Golden Smile", "Behind the Golden Smile", "A story of a woman who was a victim of violence, yet remains optimistic. This serves as a message of encouragement to stop violence against woman"),
  ModelInfo("6 Empowered Woman", "Empowered Woman", "A woman depicting empowerment and freedom through her body painting"),
  ModelInfo("7 The Great Thinker", "The Great Thinker", "Inspired from a learner who always thinks and recites the correct answer every time the teacher asks questions"),
  ModelInfo("8 Lady Farmer #2", "Lady Farmer #2", "The painting portrays the importance and beauty of farming represented by a mysterious lady. Support farmers."),
  ModelInfo("9 Tahanan","Tahanan", "The greatest gift we receive in the beginning of our lives is having a mother who cares for us unconditionally for the rest of her live. "),
  ModelInfo("10 Butil ng Buhay", "Butil ng Buhay", "This painting is inspired by the works of Fernando Amorsolo (National Artist), and it portrays farmers doing their best to supply food to the world. We must respect their sacrifices"),
  ModelInfo("11 Basket Ladies", "Basket Ladies", "Inspired  by famous Filipino Artist. Anita Magsaysay-Ho, who brought the Philippine Art in the modern world by portraying the basket ladies as different in the society."),
  ModelInfo("12 Lady Farmer #1", "Lady Farmer #1", "A lady farmer who is portraying the simplicity and hardships of life"),
  ModelInfo("13 The Buro Maker", "The Buro Maker", "This painting is inspired by Fernando Amorsolo's Works. The main subject of the painting is a woman with a jar of fermented fish (buro)."),
  ModelInfo("14 Magasin", "Magasin", 'This painting is inspired by the song "Magasin" by Eraserheads. The woman is a symbol of an unexpected teenage pregnancy.' ),
  ModelInfo("15 Nanay ko si Darna", "Nanay ko si Darna", 'This painting is inspired by our greatest Filipina superhero "Darna". Every mother is a hero willing to sacrifice for the sake of her loved ones'),
  ModelInfo("16 The Naked Woman", "The Naked Woman", "This painting represents the beauty, purity, power, and details of the body of a woman."),
  ModelInfo("17 Value", "Value", "To love and be loved is one of the greatest gifts we can have"),
  ModelInfo("18 Purity and Power", "Purity and Power", "A woman of Pure Heart and Power for development, and for service to the entirely of her constituents through good governance"),
  ModelInfo("19 The Hidden Gem", "The Hidden Gem", "Cultivating skills with the purpose of helping the community is the key to a better world for all of us."),
  ModelInfo("20 Van Gogh's Daughter", "Van Gogh's Daughter", 'This painting is inspired by the masterpiece "Starry Night" by Vincent Van Gogh, and the texture of the painting was made through small pieces of canvas cloth to make the painting more unique.'),
  ModelInfo("21 Mother's Love", "Mother's Love", "A Mother and Child rendition that portrays unconditional love of a mothter in line with education."),
  ModelInfo("22 The Albinos", "The Albinos", "This painting is inspired by the and child albinos who are living with a great amount of love for each other."),
  ModelInfo("23 Lady in the Black Box", "Lady in the Black Box", "A rendition of a woman portraying equality and her importance in the society."),
  ModelInfo("24 Prisma Woman", "Prisma Woman", "This painting of a woman portrays her equality to the society in different dimentions, regardless of her status."),
  ModelInfo("25 Bayambang's Finest", "Bayambang's Finest", "The painting Bayambang's Finest, touches the heart of the people in terms of leadership, culture, education, history, love, and effort in portraying a woman with power, victory, and dignity in which the municipality of Bayambang is known for."),
  ModelInfo("26 Baile", "Baile", 'it is titled "Baile" which refers to the night-long dance party that locals traditionally love to hold in celebration of major life events.'),
  ModelInfo("27 Bayambanguena", "Bayambanguena", 'This painting is a Portrait of Mayor Mary Clare Judith Phyllis Jose-Quiambao with the theme "Filipiniana dress Maria Clara."'),
  ModelInfo("28 Pamilya Bayambangueno", "Pamilya Bayambangueno", "The painting, Pamilya Bayambangueno, depicts the abundance of Bayambang in terms of its culture, products, beliefs, and people."),
  ModelInfo("29 The 11th Cinemanila International Film Festival", "The 11th Cinemanila International Film Festival", "Description of"),
  ModelInfo("30 Jars", "Jars", "In the past, these jars that same in different sizes were very commonly used for the storage of rice and other grains, including salt and extracted and processed sugar from sugarcane plants."),
  ModelInfo("31 A Young Girl drinks from a Buyog with a Faucet", "A Young Girl drinks from a Buyog with a Faucet", "A Young Girl drinks from a Buyog with a Faucet (1960s - 1970s) "),
  ModelInfo("32 Mortar (Lasong in Pangasinan)", "Mortar (Lasong in Pangasinan)", "This is made of solid stone used for husking palay with a pestle (alo) made of a wood. It was how the rice was peeled off from its husk before it was cooked as the peolpe's staple food."),
  ModelInfo("33 Canteen Set", "Canteen Set", "The canteen set consists of a lunchbox and a water dispenser with a cup insert. The metallic material could thus insulate food and keep drinks cold during long, hot days out in the sun."),
  ModelInfo("34 Scarecrow, Grinder, Sled, and Alo", "Scarecrow, Grinder, Sled, and Alo", "Description of Scarecrow, Grinder, Sled, and Alo"),
  ModelInfo("35 Bayambang: Onion Capital of the Philippines", "Bayambang: Onion Capital of the Philippines", "Bayambang is the top onion (Allium cepa) producer in Ilocos region, and Manambong Norte takes pride in being the first barangay to produce these bulb-shaped, white/redviolet crops with a pungent smell and bittersweet taste, varying from mild to sharp depending on the variety."),
  ModelInfo("36 Pagey, Belas, Niluto", "Pagey, Belas, Niluto", "Pagey or paguey (palay in tagalog) is the term used to refer to either the whole rice plantl or just the seeds."),
  ModelInfo("37 Gasera Lamp", "Gasera Lamp", "Undated, donated by Bayambang National High School"),
  ModelInfo("38 Lamps (Hasag in Pangasinan)", "Lamps (Hasag in Pangasinan)", "These were traditional lamps generated by petroleum gas, used for catching fish and frog (patang) at night."),
  ModelInfo("39 Bolo Knife", "Bolo Knife", "(Barang in Pangasinan) is a general term for the tradional pre-colonial small to medium-sized single-edged words or large knives that function as both tools and weapons."),
  ModelInfo("40 Fish Catching and Silew na Patang", "Fish Catching and Silew na Patang", "Undated, donated by Brgy. Capt. Basilio"),
  ModelInfo("41 Camesa de Chino", "Camesa de Chino", "A camesa de chino, also known as a Chinese collarless shirt, is a traditional Filipino garment that is typically worn as an undershirt for the barong Tagalog, the national dress of the Philippines."),
  ModelInfo("42 Maria Clara Dress", "Maria Clara Dress", "is the national custome of Filipino women. Considered a mestiza dress. It is an ensemble of indigenous and Spanish influence and was popular during the spanish era since 1890. "),
  ModelInfo("43 Balintawak and Tapis", "Balintawak and Tapis", "Balintawak was worn by Filipina women in the early half of the 20th century (c. 1930s) for picnics and outdoor activities. Tapis is a single, rectangular piece of cloth wrapped around the skirt."),
  ModelInfo("44 Corn Farming in Bayambang", "Corn Farming in Bayambang", "Bayambang's vast farmlands, if not planted with rice, are planted with corn. According to Artemio Buezon, former OIC of the Municipal Agriculture Office of the local government of Bayambang, it was in the 1980s under Mayor Calixto Camacho that Bayambang was dubbed as the 'cornbelt of Central Pangasinan'."),
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
    pickImageFromCamera();
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
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(image))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
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
      backgroundColor: const Color(0xFFE9DBC7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Image Recognition",
          style: TextStyle(
            color: Color(0xFF6F1D1B),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF6F1D1B),
          ),
        ),
      ),
      body: const SizedBox(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xFF6F1D1B),
            onPressed: pickImage,
            tooltip: "Pick Image",
            child: const Icon(Icons.image),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          FloatingActionButton(
            backgroundColor: Color(0xFF6F1D1B),
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


