import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'drawer.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold(this.body,{Key? key}) : super(key: key);
  final Widget body;
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
    final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SliderDrawer(
          appBar: const SliderAppBar(
              appBarPadding: EdgeInsets.only(top: 15),
              title: Text("BookStore",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          key: _key,
          sliderOpenSize: 200,
          slideDirection: SlideDirection.TOP_TO_BOTTOM,
          slider: SliderView(
            onItemClick: (title) {
              _key.currentState!.closeSlider();
            },
          ),
          child:
              Container(color: Colors.white70, child: widget.body)),
    );
  }
}
