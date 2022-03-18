import 'dart:async';

import '../model/booklist_model.dart';
import '../repository/booklist_repo.dart';
import 'package:flutter/cupertino.dart';



class BooklistBloc {
  late BooklistRepository booklistRepository;

  StreamController? booklistController;

  StreamSink<BooklistModel> get booklistSink =>
      booklistController!.sink as StreamSink<BooklistModel>;

  Stream<BooklistModel> get booklistStream =>
      booklistController!.stream as Stream<BooklistModel>;

  BooklistBloc() {
    booklistRepository = BooklistRepository();
    booklistController = StreamController<BooklistModel>();
  }

  getBooklist() async {
    try {
     BooklistModel response =
          await booklistRepository.data();
      booklistSink.add(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dispose() {
    booklistController?.close();
  }
}
