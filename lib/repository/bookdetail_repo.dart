import 'dart:convert';
import 'dart:core';

import '../model/bookdetail_model.dart';
import '../ui/dashboard.dart';


import 'package:http/http.dart' as http;

class BookdetailRepository {
  Future<BookdetailModel> data() async {
    final response = await http.get(
        Uri.parse("https://api.itbook.store/1.0/books/${DashboardState.id}"));

    return BookdetailModel.fromJson(json.decode(response.body));
  }
}
