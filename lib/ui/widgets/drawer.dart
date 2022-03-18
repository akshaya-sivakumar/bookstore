import 'package:bookstore/ui/dashbaord.dart';
import 'package:bookstore/ui/splash_screen.dart';
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
                side: BorderSide(color: Colors.white70, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: HexColor("#fdcfb0"),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Hi, " + SplashScreenState.nameText.text,
                      style: TextStyle(
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
                      padding: EdgeInsets.only(top: 0),
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
                                      builder: (context) => Dashboard()),
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
                        /*     _SliderMenuItem(
                            title: 'Setting',
                            iconData: Icons.settings,
                            onTap: onItemClick), */
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
        /*    child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nick',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'BalsamiqSans'),
            ),
            SizedBox(
              height: 20,
            ),
            _SliderMenuItem(
                title: 'Home',
                iconData: Icons.home,
                onTap: (data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                }),
            _SliderMenuItem(
                title: 'Notification',
                iconData: Icons.notifications_active,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Wishlist', iconData: Icons.favorite, onTap: onItemClick),
            _SliderMenuItem(
                title: 'Setting', iconData: Icons.settings, onTap: onItemClick),
            _SliderMenuItem(
                title: 'LogOut',
                iconData: Icons.arrow_back_ios,
                onTap: onItemClick),
          ],
        ), */
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
        contentPadding: EdgeInsets.only(left: 7),
        leading: Icon(iconData, color: Colors.black),
        title: Text(title,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'BalsamiqSans_Regular')),
      ),
    );
  }
}

class _AuthorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> dataList = [];
    dataList.add(Data(Colors.amber, 'Amelia Brown',
        'Life would be a great deal easier if dead things had the decency to remain dead.'));
    dataList.add(Data(Colors.orange, 'Olivia Smith',
        'That proves you are unusual," returned the Scarecrow'));
    dataList.add(Data(Colors.deepOrange, 'Sophia Jones',
        'Her name badge read: Hello! My name is DIE, DEMIGOD SCUM!'));
    dataList.add(Data(Colors.red, 'Isabella Johnson',
        'I am about as intimidating as a butterfly.'));
    dataList.add(Data(Colors.purple, 'Emily Taylor',
        'Never ask an elf for help; they might decide your better off dead, eh?'));
    dataList.add(Data(Colors.green, 'Maya Thomas', 'Act first, explain later'));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          scrollDirection: Axis.horizontal,
          //   physics: BouncingScrollPhysics(),
          //    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemBuilder: (builder, index) {
            return Container(
              height: 20,
              width: 70,
              decoration: new BoxDecoration(
                  color: dataList[index].color,
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      dataList[index].name,
                      style: TextStyle(
                          fontFamily: 'BalsamiqSans_Blod',
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      dataList[index].detail,
                      style: TextStyle(
                          fontFamily: 'BalsamiqSans_Regular',
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: dataList.length),
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
  static Color blue() => Color(0xff5e6ceb);

  static Color blueDark() => Color(0xff4D5DFB);
}
