class Book {
  String bid;
  String name;
  String? author;
  int? publishYear;
  int page;
  String? image;
  String? genre;
  String? description;

  Book({
    required this.bid,
    required this.name,
    this.author,
    this.publishYear,
    required this.page,
    this.image,
    this.genre,
    this.description,
  });
}
