import 'dart:async';

import 'package:bookstore/model/booklist_model.dart';

import 'package:bookstore/repository/yourbooks_repo.dart';
import 'package:flutter/cupertino.dart';



class YourbooksBloc {
  late YourbooksRepository yourbooksRepository;

  StreamController? yourbooksController;

  StreamSink<BooklistModel> get yourbooksSink =>
      yourbooksController!.sink as StreamSink<BooklistModel>;

  Stream<BooklistModel> get yourbooksStream =>
      yourbooksController!.stream as Stream<BooklistModel>;

  YourbooksBloc() {
    yourbooksRepository = YourbooksRepository();
    yourbooksController = StreamController<BooklistModel>();
  }

  getYourbooks() async {
    try {
     BooklistModel response =
          await yourbooksRepository.data();
      yourbooksSink.add(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dispose() {
    yourbooksController?.close();
  }
}
