import 'dart:convert';
import 'dart:core';

import '../ui/dashboard.dart';

import '../model/booklist_model.dart';
import 'package:http/http.dart' as http;

class BooklistRepository {
  Future<BooklistModel> data() async {
    final response = await http.get(Uri.parse(
        "https://api.itbook.store/1.0/search/${DashboardState.type}"));

    return BooklistModel.fromJson(json.decode(response.body));
  }
}
