class BooklistModel {
  BooklistModel({
    required this.error,
    required this.total,
    required this.books,
  });
  late final String error;
  late final String total;
  late final List<Books> books;
  
  BooklistModel.fromJson(Map<String, dynamic> json){
    error = json['error'];
    total = json['total'];
    books = List.from(json['books']).map((e)=>Books.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['total'] = total;
    _data['books'] = books.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Books {
  Books({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });
  late final String title;
  late final String subtitle;
  late final String isbn13;
  late final String price;
  late final String image;
  late final String url;
  
  Books.fromJson(Map<String, dynamic> json){
    title = json['title'];
    subtitle = json['subtitle'];
    isbn13 = json['isbn13'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['isbn13'] = isbn13;
    _data['price'] = price;
    _data['image'] = image;
    _data['url'] = url;
    return _data;
  }
}