import 'dart:convert';
import 'dart:core';

import 'package:bookstore/ui/dashbaord.dart';

import '../model/booklist_model.dart';
import 'package:http/http.dart' as http;

class YourbooksRepository {
  Future<BooklistModel> data() async {
    final response = await http.get(Uri.parse(
        "https://api.itbook.store/1.0/search/popular"));

    return BooklistModel.fromJson(json.decode(response.body));
  }
}
