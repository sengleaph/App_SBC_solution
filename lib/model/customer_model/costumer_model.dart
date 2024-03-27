// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  String? id;
  String? code;
  String? company;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? price;
  String? customerGroup;
  String? address;

  CustomerModel({
    this.id,
    this.code,
    this.company,
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.price,
    this.customerGroup,
    this.address,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json["id"],
    code: json["code"],
    company: json["company"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    price: json["price"],
    customerGroup: json["customerGroup"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "company": company,
    "name": name,
    "email": email,
    "phone": phone,
    "gender": gender,
    "price": price,
    "customerGroup": customerGroup,
    "address": address,
  };
}
