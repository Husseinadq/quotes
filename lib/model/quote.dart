import 'package:cloud_firestore/cloud_firestore.dart';

class Quote {
  String id;
  String context;
  String author;
  String publisherId;
  String category;
  DateTime createdAt;
  bool status;
  int likes;

  Quote(
      {required this.id,
      required this.context,
      required this.author,
      required this.publisherId,
      required this.category,
      required this.createdAt,
      required this.status,
      required this.likes});

  factory Quote.fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json["createdAt"];
    DateTime dateTime = timestamp.toDate();
    return Quote(
      id: json["id"],
      context: json["context"],
      author: json["author"],
      publisherId: json["publisherId"],
      category: json["category"],
      createdAt: dateTime,
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
      "createdAt": createdAt,
      "status": status,
      "likes": likes,
    };
  }
}
