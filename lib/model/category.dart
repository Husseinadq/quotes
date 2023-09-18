class Category {
  int id;
  String name;
  int parentId;
  bool status;
  Category(
      {required this.id,
      required this.name,
      required this.parentId,
      required this.status});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      parentId: json["parentId"],
      status: json["status"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "parentId": parentId,
      "status": status,
    };
  }
}
