// To parse this JSON data, do
//
//     final customerModelPost = customerModelPostFromJson(jsonString);

import 'dart:convert';

CustomerModelPost customerModelPostFromJson(String str) => CustomerModelPost.fromJson(json.decode(str));

String customerModelPostToJson(CustomerModelPost data) => json.encode(data.toJson());

class CustomerModelPost {
  Data? data;

  CustomerModelPost({
    this.data,
  });

  factory CustomerModelPost.fromJson(Map<String, dynamic> json) => CustomerModelPost(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? gender;
  String? company;
  String? phone;
  String? price;
  String? customerGroup;
  String? address;
  String? code;
  String? email;

  Data({
    this.name,
    this.gender,
    this.company,
    this.phone,
    this.price,
    this.customerGroup,
    this.address,
    this.code,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(

    name: json["name"],
    gender: json["gender"],
    company: json["company"],
    phone: json["phone"],
    price: json["price"],
    customerGroup: json["customerGroup"],
    address: json["address"],
    code: json["code"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {

    "name": name,
    "gender": gender,
    "company": company,
    "phone": phone,
    "price": price,
    "customerGroup": customerGroup,
    "address": address,
    "code": code,
    "email": email,
  };
}
