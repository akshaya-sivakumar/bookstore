import 'package:bookstore/ui/dashbaord.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => new SplashScreenState();
}

// ------------------ Custom config ------------------
// class SplashScreenState extends State<SplashScreen> {
//   List<Slide> slides = [];

//   @override
//   void initState() {
//     super.initState();

//     slides.add(
//       new Slide(
//         title:
//             "A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE A VERY LONG TITLE",
//         maxLineTitle: 2,
//         styleTitle: TextStyle(
//           color: Colors.white,
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold,
//           fontFamily: 'RobotoMono',
//         ),
//         description:
//             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
//         styleDescription: TextStyle(
//           color: Colors.white,
//           fontSize: 20.0,
//           fontStyle: FontStyle.italic,
//           fontFamily: 'Raleway',
//         ),
//         marginDescription:
//             EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
//         centerWidget: Text("Replace this with a custom widget",
//             style: TextStyle(color: Colors.white)),
//         backgroundImage: "assets/images/screen1.png",
//         directionColorBegin: Alignment.topLeft,
//         directionColorEnd: Alignment.bottomRight,
//         onCenterItemPress: () {},
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "CITY",
//         styleTitle: TextStyle(
//             color: Color(0xff7FFFD4),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Ye indulgence unreserved connection alteration appearance",
//         styleDescription: TextStyle(
//             color: Color(0xff7FFFD4),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         backgroundImage: "assets/images/screen2.png",
//         directionColorBegin: Alignment.topRight,
//         directionColorEnd: Alignment.bottomLeft,
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "BEACH",
//         styleTitle: TextStyle(
//             color: Color(0xffFFDAB9),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//         styleDescription: TextStyle(
//             color: Color(0xffFFDAB9),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         backgroundImage: "assets/images/screen3.png",
//         directionColorBegin: Alignment.topCenter,
//         directionColorEnd: Alignment.bottomCenter,
//         maxLineTextDescription: 3,
//       ),
//     );
//   }

//   void onDonePress() {
//     // Do what you want
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => HomeScreen()),
//     // );
//   }

//   void onNextPress() {
//     print("onNextPress caught");
//   }

//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
//       color: Color(0xffF3B4BA),
//       size: 35.0,
//     );
//   }

//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       color: Color(0xffF3B4BA),
//     );
//   }

//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       color: Color(0xffF3B4BA),
//     );
//   }

//   ButtonStyle myButtonStyle() {
//     return ButtonStyle(
//       shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
//       backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
//       overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new IntroSlider(
//       // List slides
//       slides: this.slides,

//       // Skip button
//       renderSkipBtn: this.renderSkipBtn(),
//       skipButtonStyle: myButtonStyle(),

//       // Next button
//       renderNextBtn: this.renderNextBtn(),
//       onNextPress: this.onNextPress,
//       nextButtonStyle: myButtonStyle(),

//       // Done button
//       renderDoneBtn: this.renderDoneBtn(),
//       onDonePress: this.onDonePress,
//       doneButtonStyle: myButtonStyle(),

//       // Dot indicator
//       colorDot: Color(0x33FFA8B0),
//       colorActiveDot: Color(0xffFFA8B0),
//       sizeDot: 13.0,

//       // Show or hide status bar
//       hideStatusBar: true,
//       backgroundColorAllSlides: Colors.grey,

//       // Scrollbar
//       verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
//     );
//   }
// }

//------------------ Custom your own tabs ------------------
// class SplashScreenState extends State<SplashScreen> {
//   List<Slide> slides = [];

//   late Function goToTab;

//   @override
//   void initState() {
//     super.initState();

//     slides.add(
//       new Slide(
//         title: "SCHOOL",
//         styleTitle: TextStyle(
//           color: Color(0xff3da4ab),
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold,
//           fontFamily: 'RobotoMono',
//         ),
//         description:
//             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/screen1.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "MUSEUM",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Ye indulgence unreserved connection alteration appearance",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/screen2.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: "COFFEE SHOP",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//             "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//         styleDescription: TextStyle(
//             color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/screen3.png",
//       ),
//     );
//   }

//   void onDonePress() {
//     // Back to the first tab
//     this.goToTab(0);
//   }

//   void onTabChangeCompleted(index) {
//     // Index of current tab is focused
//     print(index);
//   }

//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
//       color: Color(0xffffcc5c),
//       size: 35.0,
//     );
//   }

//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       color: Color(0xffffcc5c),
//     );
//   }

//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       color: Color(0xffffcc5c),
//     );
//   }

//   ButtonStyle myButtonStyle() {
//     return ButtonStyle(
//       shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
//       backgroundColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
//       overlayColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
//     );
//   }

//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = [];
//     for (int i = 0; i < slides.length; i++) {
//       Slide currentSlide = slides[i];
//       tabs.add(Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
//           child: ListView(
//             children: <Widget>[
//               GestureDetector(
//                   child: Image.asset(
//                 currentSlide.pathImage!,
//                 width: 200.0,
//                 height: 200.0,
//                 fit: BoxFit.contain,
//               )),
//               Container(
//                 child: Text(
//                   currentSlide.title ?? "",
//                   style: currentSlide.styleTitle,
//                   textAlign: TextAlign.center,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//               Container(
//                 child: Text(
//                   currentSlide.description ?? "",
//                   style: currentSlide.styleDescription,
//                   textAlign: TextAlign.center,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//             ],
//           ),
//         ),
//       ));
//     }
//     return tabs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new IntroSlider(
//       // Skip button
//       renderSkipBtn: this.renderSkipBtn(),
//       skipButtonStyle: myButtonStyle(),

//       // Next button
//       renderNextBtn: this.renderNextBtn(),
//       nextButtonStyle: myButtonStyle(),

//       // Done button
//       renderDoneBtn: this.renderDoneBtn(),
//       onDonePress: this.onDonePress,
//       doneButtonStyle: myButtonStyle(),

//       // Dot indicator
//       colorDot: Color(0xffffcc5c),
//       sizeDot: 13.0,
//       typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

//       // Tabs
//       listCustomTabs: this.renderListCustomTabs(),
//       backgroundColorAllSlides: Colors.white,
//       refFuncGoToTab: (refFunc) {
//         this.goToTab = refFunc;
//       },

//       // Behavior
//       scrollPhysics: BouncingScrollPhysics(),

//       // Show or hide status bar
//       hideStatusBar: true,

//       // On tab change completed
//       onTabChangeCompleted: this.onTabChangeCompleted,
//     );
//   }
// }

// ------------------ Default config ------------------
class SplashScreenState extends State<SplashScreen> {
  List<Slide> slides = [];
  final _form = GlobalKey<FormState>();
  bool _validate = false;
  static TextEditingController nameText = TextEditingController();
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
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
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          pathImage: "assets/images/screen1.png",
          backgroundColor: Colors.white,
          backgroundImageFit: BoxFit.fitHeight,
          widthImage: 350,
          heightImage: 380),
    );
    slides.add(
      new Slide(
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
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          pathImage: "assets/images/screen2.png",
          backgroundColor: Colors.white,
          backgroundImageFit: BoxFit.fitHeight,
          widthImage: 350,
          heightImage: 380),
    );
    slides.add(
      new Slide(
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
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(5),
                //  height: 50,
                //width: MediaQuery.of(context).size.width * 0.9,
                child: Form(
                  key: _form,
                  child: TextFormField(
                    controller: nameText,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red),
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
                        suffixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.only(left: 10)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (nameText.text == "") return "Please enter your name";
                    },
                  ),
                ),
              ),
            ],
          ),
          styleDescription:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
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
      onDonePress: this.onDonePress,
    );
  }
}
