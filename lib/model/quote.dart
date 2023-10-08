class Quote {
  String id;
  String context;
  String author;
  String publisherId;
  String category;
  bool status;
  int likes;


  Quote(
      {required this.id,
      required this.context,
      required this.author,
      required this.publisherId,
      required this.category,
      required this.status,
      required this.likes});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json["id"],
      context: json["context"],
      author: json["author"],
      publisherId: json["publisherId"],
      category: json["category"],
      status: json["status"],
      likes: json["likes"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "context": context,
      "author": author,
      "publisherId": publisherId,
      "category": category,
      "status": status,
      "likes": likes,
    };
  }
}
