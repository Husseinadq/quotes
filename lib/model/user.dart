class User {
  int id;
  String name;
  String password;
  String imageUrl;
  int quoteNumber;
  User(
      { required this.id,
        required this.name,
      required this.password,
      required this.imageUrl,
      required this.quoteNumber});
    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      password: json["password"],
      imageUrl: json["imageUrl"],
      quoteNumber: json["quoteNumber"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
       "id": id,
      "name": name,
      "password":password,
      "imageUrl":imageUrl,
      "quoteNumber": quoteNumber
    };
  }  
}
