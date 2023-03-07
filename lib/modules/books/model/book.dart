class Book {
  String? bid;
  String? name;
  String? author;
  int? publishYear;
  int? page;
  String? image;
  String? genre;
  String? description;

  Book({
    this.bid,
    this.name,
    this.author,
    this.publishYear,
    this.page,
    this.image,
    this.genre,
    this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        bid: json['id'],
        name: json['name'],
        author: json['author'],
        image: json['image'],
        genre: json['genre'],
        description: json['description'],
        page: json['page'],
        publishYear: json['publish_year'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "image": image,
        "genre": genre,
        "description": description,
        "page": page,
        "publish_year": publishYear,
      };
}
