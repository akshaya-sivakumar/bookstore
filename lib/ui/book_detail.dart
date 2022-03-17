import 'package:bookstore/bloc/bookdetail_bloc.dart';
import 'package:bookstore/model/bookdetail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                                  fontSize: 15,
                                  color: Colors.black87),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 25,
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
                                  fontSize: 15,
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
                        children: [
                          Text(
                            "Price: ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.orangeAccent[400]),
                          ),
                          Text(
                            datas.price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "M.R.P  :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
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
                      rowButtons(context, "Length  ", "220 Pages", "Language ",
                          "English"),
                      ColumnButtons(
                        context,
                        "Author  ",
                        datas.authors,
                        "Publisher ",
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
                              datas.desc,
                              style: TextStyle(color: Colors.black87),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
              : Container(
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

  Row ColumnButtons(
      BuildContext context, String title1, subtitle1, title2, subtitle2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.43,
          child: ElevatedButton(
            child: Column(
              children: [
                Text(
                  title1,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 3,
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
          child: Column(
            children: [
              Text(
                title2,
                style: TextStyle(color: Colors.grey),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: ElevatedButton(
                    child: Text(
                      "More Info",
                      style: TextStyle(color: Colors.grey),
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
                  child: Text(
                    "Add to wishlist",
                    style: TextStyle(color: Colors.grey),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  onPressed: () {
                    print('Pressed');
                  },
                )
              ],
            ),
          ),
        ),
        body: Container(
            child: SingleChildScrollView(child: _buildContent(context))));
  }
}
