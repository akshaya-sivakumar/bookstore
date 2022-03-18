import 'dart:async';

import '../model/bookdetail_model.dart';
import '../repository/bookdetail_repo.dart';
import 'package:flutter/cupertino.dart';



class BookdetailBloc {
  late BookdetailRepository bookdetailRepository;

  StreamController? bookdetailController;

  StreamSink<BookdetailModel> get bookdetailSink =>
      bookdetailController!.sink as StreamSink<BookdetailModel>;

  Stream<BookdetailModel> get bookdetailStream =>
      bookdetailController!.stream as Stream<BookdetailModel>;

  BookdetailBloc() {
    bookdetailRepository = BookdetailRepository();
    bookdetailController = StreamController<BookdetailModel>();
  }

  getBookdetail() async {
    try {
     BookdetailModel response =
          await bookdetailRepository.data();
      bookdetailSink.add(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dispose() {
    bookdetailController?.close();
  }
}
