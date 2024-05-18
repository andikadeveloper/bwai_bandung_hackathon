import 'package:bwai_bandung_hackathon/domain/entities/user.dart';

class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  User toEntity() {
    return User(
      id: id ?? '',
      name: name ?? '',
      email: email ?? '',
    );
  }
}
