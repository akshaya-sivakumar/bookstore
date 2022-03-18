import 'package:bookstore/bloc/bookdetail_bloc.dart';
import 'package:bookstore/model/bookdetail_model.dart';
import 'package:bookstore/ui/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  BookDetailState createState() => BookDetailState();
}

class BookDetailState extends State<BookDetail> {
  late BookdetailBloc bookdetailBloc;
  @override
  void initState() {
    super.initState();
    bookdetailBloc = BookdetailBloc();
    bookdetailBloc.getBookdetail();
  }

  var datas;
  Widget _buildContent(BuildContext context) {
    return StreamBuilder<BookdetailModel>(
        stream: bookdetailBloc.bookdetailStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) datas = snapshot.data;
          return snapshot.connectionState != ConnectionState.waiting
              ? Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              datas.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black87),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: RatingBar.builder(
                              initialRating: double.parse(datas.rating),
                              minRating: 1,
                              itemSize: 22,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              datas.subtitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        overflow: Overflow.clip,
                        children: [
                          Image.network(
                            datas.image,
                            width: 350,
                            height: 350,
                          ),
                          Positioned(
                            top: 12,
                            left: 28,
                            child: Container(
                              child: Image.asset(
                                "assets/images/stock.png",
                                color: Colors.green,
                                colorBlendMode: BlendMode.dst,
                              ),
                            ),
                            width: 120,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Price :  ",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: Colors.orangeAccent[400]),
                              ),
                              Text(
                                datas.price,
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold, fontSize: 23),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.all(5),
                                child: LikeButton(likeBuilder: (isLiked) {
                                  if (isLiked == true)
                                    Fluttertoast.showToast(
                                        msg: "Added to wishlist",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.pink,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                }),
                              ),
                              Text(
                                "Add to wishlist ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "M.R.P  : ",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.grey),
                          ),
                          Text(
                            "20.97",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      rowButtons(context, "Length  ", datas.pages + " Pages",
                          "Language ", datas.language),
                      ColumnButtons(
                        context,
                        "Author         ",
                        datas.authors,
                        "Publisher   ",
                        datas.publisher,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "       " + datas.desc,
                              style: GoogleFonts.lato(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Published At : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              datas.year,
                              style: GoogleFonts.lato(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                "Download PDF : ",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                await launch(
                                    "https://itbook.store/books/${datas.isbn13}");
                              },
                              child: Text(
                                "Click here",
                                style: GoogleFonts.lato(
                                    color: HexColor("#F54D3D"), fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: FractionalOffset.center,
                  child: const CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                );
        });
  }

  Row rowButtons(
      BuildContext context, String title1, subtitle1, title2, subtitle2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.43,
          child: ElevatedButton(
            child: Row(
              children: [
                Text(
                  title1,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  subtitle1,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[200],
              onPrimary: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
        ),
        ElevatedButton(
          child: Row(
            children: [
              Text(
                title2,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                subtitle2,
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[200],
            onPrimary: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
          onPressed: () {
            print('Pressed');
          },
        )
      ],
    );
  }

  Widget ColumnButtons(
      BuildContext context, String title1, subtitle1, title2, subtitle2) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: HexColor("#FBAA60"), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#FFE5B4"),
          ),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title1,
                    style: GoogleFonts.lato(color: HexColor("#A82810")),
                  ),
                  Expanded(
                    child: Text(
                      subtitle1,
                      style: GoogleFonts.lato(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    title2,
                    style: TextStyle(color: HexColor("#A82810")),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    subtitle2,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("BookStore"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: <Color>[HexColor("#F67B50"), HexColor("#FBAA60")]),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.arrow_downward),
                    label: Text(
                      "More Info",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent[400],
                      onPrimary: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewContainer(
                                WebViewContainerArguments(
                                    datas.url, datas.title))),
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.shopping_cart),
                    label: Text(
                      "Buy now",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewContainer(
                                WebViewContainerArguments(
                                    "https://www.amazon.com/dp/${datas.isbn10}/?tag=isbndir-20",
                                    datas.title))),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(child: _buildContent(context))));
  }
}
