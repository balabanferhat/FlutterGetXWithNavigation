class User {
  String name;
  String surname;
  String token;

  User({this.name, this.surname, this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['token'] = this.token;
    return data;
  }
}
