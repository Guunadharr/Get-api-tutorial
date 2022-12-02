import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? avatar;
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstname: json['first_name'] ?? 'First Name',
      lastname: json['last_name'] ?? 'Last Name',
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
