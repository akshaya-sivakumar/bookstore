import 'package:flutter/foundation.dart';

import '../bloc/bookdetail_bloc.dart';
import '../model/bookdetail_model.dart';
import 'web_view.dart';
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

  BookdetailModel? datas;
  Widget _buildContent(BuildContext context) {
    return StreamBuilder<BookdetailModel>(
        stream: bookdetailBloc.bookdetailStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) datas = snapshot.data;
          return snapshot.connectionState != ConnectionState.waiting
              ? onGridBooks(context)
              : Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: FractionalOffset.center,
                  child: const CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                );
        });
  }

  Widget onGridBooks(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    datas?.title ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black87),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: RatingBar.builder(
                    initialRating: double.parse(datas?.rating ?? "0"),
                    minRating: 1,
                    itemSize: 22,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      size: 10,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    datas?.subtitle ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                if (datas!.image != null)
                  Image.network(
                    datas!.image,
                    width: 350,
                    height: 350,
                    errorBuilder: (context, error, stackTrace) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
                        child: Image.network(
                          "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=170667a&w=0&h=mRTFds0L_Hq63ohdqIdHXMrE32DqOnajt4I0yJ1bBtU=",
                          height: 100,
                          width: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return Container();
                          },
                        ),
                      );
                    },
                  )
                else
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                    child: Image.network(
                      "https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?k=20&m=922962354&s=170667a&w=0&h=mRTFds0L_Hq63ohdqIdHXMrE32DqOnajt4I0yJ1bBtU=",
                      height: 100,
                      width: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return Container();
                      },
                    ),
                  ),
                Positioned(
                  top: 12,
                  left: 28,
                  child: Image.asset(
                    "assets/images/stock.png",
                    color: Colors.green,
                    colorBlendMode: BlendMode.dst,
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
                          fontSize: 15, color: Colors.orangeAccent[400]),
                    ),
                    Text(
                      datas?.price ?? "",
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
                      padding: const EdgeInsets.all(5),
                      child: LikeButton(likeBuilder: (isLiked) {
                        if (isLiked == true) {
                          Fluttertoast.showToast(
                              msg: "Added to wishlist",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.pink,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        return null;
                      }),
                    ),
                    const Text(
                      "Add to wishlist ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
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
                const Text(
                  "20.97",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                )
              ],
            ),
            rowButtons(context, "Length  ", (datas?.pages ?? "") + " Pages",
                "Language ", datas?.language),
            columnButtons(
              context,
              "Author         ",
              datas?.authors ?? "",
              "Publisher   ",
              datas?.publisher ?? "",
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "       " + (datas?.desc ?? ""),
                    style: GoogleFonts.lato(),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Published At : ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    datas?.year ?? "",
                    style: GoogleFonts.lato(),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      "Download PDF : ",
                      style: GoogleFonts.lato(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () async {
                      await launch(
                          "https://itbook.store/books/${datas?.isbn13}");
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
        ));
  }

  Row rowButtons(
      BuildContext context, String title1, subtitle1, title2, subtitle2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.43,
          child: ElevatedButton(
            child: Row(
              children: [
                Text(
                  title1,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  subtitle1,
                  style: const TextStyle(
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
              if (kDebugMode) {
                print('Pressed');
              }
            },
          ),
        ),
        ElevatedButton(
          child: Row(
            children: [
              Text(
                title2,
                style: const TextStyle(color: Colors.grey),
              ),
              Text(
                subtitle2,
                style: const TextStyle(
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
            if (kDebugMode) {
              print('Pressed');
            }
          },
        )
      ],
    );
  }

  Widget columnButtons(
      BuildContext context, String title1, subtitle1, title2, subtitle2) {
    return Container(
      margin: const EdgeInsets.all(5),
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
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
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
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    title2,
                    style: TextStyle(color: HexColor("#A82810")),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    subtitle2,
                    style: const TextStyle(
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
          title: const Text("BookStore"),
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
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_downward),
                    label: const Text(
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
                                    datas!.url, datas!.title))),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
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
                                    "https://www.amazon.com/dp/${datas!.isbn10}/?tag=isbndir-20",
                                    datas!.title))),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(child: _buildContent(context)));
  }
}
