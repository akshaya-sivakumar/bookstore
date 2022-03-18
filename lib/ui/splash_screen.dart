import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  List<Slide> slides = [];
  final _form = GlobalKey<FormState>();
  final bool _validate = false;
  static TextEditingController nameText = TextEditingController();
  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
          // title: "BOOKSTORE",
          widgetTitle: Image.asset(
            "assets/images/logo.png",
            width: 150,
          ),
          styleTitle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor("#F67B50")),
          description: "Select your Book",
          styleDescription:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          pathImage: "assets/images/screen1.png",
          backgroundColor: Colors.white,
          backgroundImageFit: BoxFit.fitHeight,
          widthImage: 350,
          heightImage: 380),
    );
    slides.add(
      Slide(
          // title: "BOOKSTORE",
          widgetTitle: Image.asset(
            "assets/images/logo.png",
            width: 150,
          ),
          styleTitle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor("#F67B50")),
          description: "Online Purchase",
          styleDescription:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          pathImage: "assets/images/screen2.png",
          backgroundColor: Colors.white,
          backgroundImageFit: BoxFit.fitHeight,
          widthImage: 350,
          heightImage: 380),
    );
    slides.add(
      Slide(
          //title: "BOOKSTORE",
          widgetTitle: Image.asset(
            "assets/images/logo.png",
            width: 120,
          ),
          styleTitle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor("#F67B50")),
          //description: "Get your Book",
          widgetDescription: Column(
            children: [
              Text(
                "Let's get started..",
                style: TextStyle(
                    color: HexColor("#F67B50"),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Form(
                  key: _form,
                  child: TextFormField(
                    controller: nameText,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.red),
                        errorText: _validate ? 'Value Can\'t Be Empty' : null,
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: HexColor("#F54D3D"), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: HexColor("#F54D3D"), width: 2.0),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor("#F54D3D"), width: 2.0),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter your name....',
                        suffixIcon: const Icon(Icons.person),
                        contentPadding: const EdgeInsets.only(left: 10)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (nameText.text == "") return "Please enter your name";
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          styleDescription:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          pathImage: "assets/images/screen3.png",
          backgroundColor: Colors.white,
          backgroundImageFit: BoxFit.fitHeight,
          widthImage: 320,
          heightImage: 320),
    );
  }

  void onDonePress() {
    if (_form.currentState?.validate() ?? false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      colorActiveDot: HexColor("#F67B50"),
      sizeDot: 15,
      colorDot: HexColor("#FFE5B4"),
      skipButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(HexColor("#F67B50")),
      ),
      doneButtonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(HexColor("#F67B50")),
      ),
      isScrollable: false,
      hideStatusBar: true,
      onDonePress: onDonePress,
    );
  }
}
