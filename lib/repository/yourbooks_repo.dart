import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import '../model/booklist_model.dart';

class YourbooksRepository {
  Future<BooklistModel> data() async {
    final response = await http.get(Uri.parse(
        "https://api.itbook.store/1.0/search/popular"));

    return BooklistModel.fromJson(json.decode(response.body));
  }
}
