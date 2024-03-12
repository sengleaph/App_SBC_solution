// // To parse this JSON data, do
// //
// //     final authModel = authModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));
//
// String authModelToJson(AuthModel data) => json.encode(data.toJson());
//
// class AuthModel {
//   String? jwt;
//   User? user;
//
//   AuthModel({
//     this.jwt,
//     this.user,
//   });
//
//   factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
//     jwt: json["jwt"],
//     user: json["user"] == null ? null : User.fromJson(json["user"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "jwt": jwt,
//     "user": user?.toJson(),
//   };
// }
//
// class User {
//   int? id;
//   String? username;
//   String? email;
//   String? provider;
//   bool? confirmed;
//   bool? blocked;
//   dynamic gender;
//   dynamic workplace;
//   dynamic location;
//
//   User({
//     this.id,
//     this.username,
//     this.email,
//     this.provider,
//     this.confirmed,
//     this.blocked,
//     this.gender,
//     this.workplace,
//     this.location,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     username: json["username"],
//     email: json["email"],
//     provider: json["provider"],
//     confirmed: json["confirmed"],
//     blocked: json["blocked"],
//     gender: json["gender"],
//     workplace: json["workplace"],
//     location: json["location"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "email": email,
//     "provider": provider,
//     "confirmed": confirmed,
//     "blocked": blocked,
//     "gender": gender,
//     "workplace": workplace,
//     "location": location,
//   };
// }
