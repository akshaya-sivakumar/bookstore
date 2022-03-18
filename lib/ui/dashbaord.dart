import 'package:bookstore/bloc/booklist_bloc.dart';
import 'package:bookstore/bloc/yourbooks_bloc.dart';
import 'package:bookstore/model/booklist_model.dart';
import 'package:bookstore/ui/book_detail.dart';
import 'package:bookstore/ui/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  static String type = "new";
  static String id = "";
  late BooklistBloc booklistBloc;
  late YourbooksBloc yourbooksBloc;
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    booklistBloc = BooklistBloc();
    booklistBloc.getBooklist();
    yourbooksBloc = YourbooksBloc();
    yourbooksBloc.getYourbooks();
  }

  var data, yourdata;
  Widget _buildContent(BuildContext context) {
    return StreamBuilder<BooklistModel>(
        stream: booklistBloc.booklistStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) data = snapshot.data?.books;
          return snapshot.connectionState != ConnectionState.waiting
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 12, right: 5, top: 5, bottom: 5),
                          child: Text(
                            "Books for you...",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 170,
                      child: StreamBuilder<BooklistModel>(
                          stream: yourbooksBloc.yourbooksStream,
                          builder: (context, snapshot) {
                            yourdata = snapshot.data?.books;
                            return snapshot.connectionState !=
                                    ConnectionState.waiting
                                ? GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 3 / 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemCount: yourdata.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            DashboardState.id =
                                                data[index].isbn13;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookDetail()),
                                            );
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: HexColor("#F67B50"),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 5,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      yourdata[index].image,
                                                      width: 100,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Text(
                                                          yourdata[index].title,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                            ),
                                            Positioned(
                                                top: -4,
                                                left: -5,
                                                child: Image.asset(
                                                  "assets/images/new.png",
                                                  width: 45,
                                                  height: 50,
                                                ))
                                          ],
                                        ),
                                      );
                                    })
                                : Container(
                                    alignment: FractionalOffset.center,
                                    child: const CircularProgressIndicator(
                                        backgroundColor: Colors.black87,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white)),
                                  );
                          }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 45,
                      //width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: HexColor("#FBAA60"), width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: HexColor("#FBAA60"), width: 2.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            hintText: 'Search....',
                            suffixIcon: DashboardState.type != "new"
                                ? IconButton(
                                    onPressed: () {
                                      _controller.clear();
                                      DashboardState.type = "new";
                                      booklistBloc.getBooklist();
                                    },
                                    icon: Icon(Icons.close))
                                : null,
                            contentPadding: EdgeInsets.only(left: 13)),
                        onChanged: (value) {
                          DashboardState.type = value;
                          booklistBloc.getBooklist();
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    DashboardState.id = data[index].isbn13;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BookDetail()),
                                    );
                                  });
                                },
                                child: Card(
                                    child: Container(
                                        child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      data![index].image,
                                      height: 90,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              data[index].title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Text(
                                              data[index].subtitle,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey),
                                            ))
                                      ],
                                    ),
                                    ElevatedButton(
                                      child: Text(data[index].price),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.orangeAccent[400],
                                        onPrimary: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))),
                                      ),
                                      onPressed: () {
                                        print('Pressed');
                                      },
                                    )
                                  ],
                                ))),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Container(
                  alignment: FractionalOffset.center,
                  child: const CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                );
        });
  }

  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [Icon(Icons.notification_add)],
          title: Text("BookStore"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: <Color>[HexColor("#F67B50"), HexColor("#FBAA60")]),
            ),
          ),
        ), */
      // backgroundColor: Theme.of(context).primaryColor,
      body: SliderDrawer(
          appBar: SliderAppBar(
              appBarPadding: EdgeInsets.only(top: 15),
              title: Text("BookStore",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700))),
          key: _key,
          sliderOpenSize: 200,
          slideDirection: SlideDirection.TOP_TO_BOTTOM,
          slider: SliderView(
            onItemClick: (title) {
              _key.currentState!.closeSlider();
            },
          ),
          child:
              Container(color: Colors.white70, child: _buildContent(context))),
    );
  }
}
