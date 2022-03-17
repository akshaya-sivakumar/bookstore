import 'package:bookstore/bloc/booklist_bloc.dart';
import 'package:bookstore/model/booklist_model.dart';
import 'package:bookstore/ui/book_detail.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  static String type = "new";
  static String id = "";
  late BooklistBloc booklistBloc;
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    booklistBloc = BooklistBloc();
    booklistBloc.getBooklist();
  }

  var data;
  Widget _buildContent(BuildContext context) {
    return StreamBuilder<BooklistModel>(
        stream: booklistBloc.booklistStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) data = snapshot.data?.books;
          return snapshot.connectionState != ConnectionState.waiting
              ? ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index == 0)
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 40,
                            //width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
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
                                  contentPadding: EdgeInsets.all(3)),
                              onChanged: (value) {
                                DashboardState.type = value;
                                booklistBloc.getBooklist();
                              },
                            ),
                          ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                data![index].image,
                                height: 90,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
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
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        data[index].subtitle,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ))
                                ],
                              ),
                              ElevatedButton(
                                child: Text(data[index].price),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent[400],
                                  onPrimary: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
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
                )
              : Container(
                  alignment: FractionalOffset.center,
                  child: const CircularProgressIndicator(
                      backgroundColor: Colors.black87,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BookStore"),
        ),
        // backgroundColor: Theme.of(context).primaryColor,
        body: _buildContent(context));
  }
}
