class BookdetailModel {
  BookdetailModel({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
    //required this.pdf,
  });
  late final String error;
  late final String title;
  late final String subtitle;
  late final String authors;
  late final String publisher;
  late final String language;
  late final String isbn10;
  late final String isbn13;
  late final String pages;
  late final String year;
  late final String rating;
  late final String desc;
  late final String price;
  late final String image;
  late final String url;
  // late final Pdf pdf;

  BookdetailModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'];
    publisher = json['publisher'];
    language = json['language'];
    isbn10 = json['isbn10'];
    isbn13 = json['isbn13'];
    pages = json['pages'];
    year = json['year'];
    rating = json['rating'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
    //pdf = Pdf.fromJson(json['pdf']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['authors'] = authors;
    _data['publisher'] = publisher;
    _data['language'] = language;
    _data['isbn10'] = isbn10;
    _data['isbn13'] = isbn13;
    _data['pages'] = pages;
    _data['year'] = year;
    _data['rating'] = rating;
    _data['desc'] = desc;
    _data['price'] = price;
    _data['image'] = image;
    _data['url'] = url;
    //  _data['pdf'] = pdf.toJson();
    return _data;
  }
}

/* class Pdf {
  Pdf({
    required this.chapter2,
    required this.chapter5,
  });
  late final String chapter2;
  late final String chapter5;

  Pdf.fromJson(Map<String, dynamic> json) {
    chapter2 = json['chapter2'];
    chapter5 = json['chapter5'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chapter2'] = chapter2;
    _data['chapter5'] = chapter5;
    return _data;
  }
}
 */