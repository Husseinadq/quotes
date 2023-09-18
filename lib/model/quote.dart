class Quote {
  int id;
  String name;
  String author;
  String publisherId;
  int category;
  bool status;

  Quote({
    required this.id,
    required this.name,
    required this.author,
    required this.publisherId,
    required this.category,
    required this.status
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json["id"],
      name: json["name"],
      author: json["author"],
      publisherId: json["publisherId"],
      category: json["category"],
      status: json["status"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "author": author,
      "publisherId": publisherId,
      "category": category,
      "status": status,
    };
  }
}
