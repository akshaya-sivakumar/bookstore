import '../dashboard.dart';
import '../splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: <Color>[HexColor("#F67B50"), HexColor("#FBAA60")]),
        ),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 7, bottom: 5),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: HexColor("#fdcfb0"),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Hi, " + SplashScreenState.nameText.text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'BalsamiqSans'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 3.5,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: _SliderMenuItem(
                              title: 'Home',
                              iconData: Icons.home,
                              onTap: (data) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard()),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: _SliderMenuItem(
                              title: 'Notification',
                              iconData: Icons.notifications_active,
                              onTap: onItemClick),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: _SliderMenuItem(
                              title: 'Wishlist',
                              iconData: Icons.favorite,
                              onTap: onItemClick),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: _SliderMenuItem(
                              title: 'LogOut',
                              iconData: Icons.arrow_back_ios,
                              onTap: (value) {
                                SystemNavigator.pop();
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(title),
      child: ListTile(
        minLeadingWidth: 5,
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.only(left: 7),
        leading: Icon(iconData, color: Colors.black),
        title: Text(title,
            style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'BalsamiqSans_Regular')),
      ),
    );
  }
}

class Data {
  MaterialColor color;
  String name;
  String detail;

  Data(this.color, this.name, this.detail);
}

class ColoursHelper {
  static Color blue() => const Color(0xff5e6ceb);

  static Color blueDark() => const Color(0xff4D5DFB);
}
