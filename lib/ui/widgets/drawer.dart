import 'package:bookstore/ui/dashbaord.dart';
import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                  height: 10,
                )
              ],
            ),
            Expanded(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0),
                children: [
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
                      title: 'Wishlist',
                      iconData: Icons.favorite,
                      onTap: onItemClick),
                  _SliderMenuItem(
                      title: 'Setting',
                      iconData: Icons.settings,
                      onTap: onItemClick),
                  _SliderMenuItem(
                      title: 'LogOut',
                      iconData: Icons.arrow_back_ios,
                      onTap: onItemClick),
                ],
              ),
            )
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
    return ListTile(
        title: Text(title,
            style: TextStyle(
                color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
        leading: Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call(title));
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          //   physics: BouncingScrollPhysics(),
          //    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemBuilder: (builder, index) {
            return Container(
              height: 100,
              decoration: new BoxDecoration(
                  color: dataList[index].color,
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      dataList[index].name,
                      style: TextStyle(
                          fontFamily: 'BalsamiqSans_Blod',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
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
          separatorBuilder: (builder, index) {
            return Divider(
              height: 4,
              thickness: 0,
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
