// To parse this JSON data, do
//
//     final saleModel = saleModelFromJson(jsonString);

import 'dart:convert';

SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

String saleModelToJson(SaleModel data) => json.encode(data.toJson());

class SaleModel {
  String? biller;
  String? billerId;
  CreatedBy? createdBy;
  String? currencyRateKh;
  String? customer;
  String? customerId;
  DateTime? date;
  dynamic deliveryBy;
  DateTime? deliveryDate;
  dynamic deliveryStatus;
  String? id;
  dynamic image;
  dynamic images;
  dynamic locationId;
  String? moduleType;
  dynamic note;
  String? orderDiscount;
  String? orderDiscountId;
  String? orderStatus;
  String? orderTax;
  String? orderTaxId;
  String? projectId;
  String? referenceNo;
  dynamic rounding;
  String? saleStatus;
  String? salemanBy;
  String? total;
  String? totalItems;
  String? totalTax;
  dynamic updatedAt;
  dynamic updatedBy;
  String? warehouseId;

  SaleModel({
    this.biller,
    this.billerId,
    this.createdBy,
    this.currencyRateKh,
    this.customer,
    this.customerId,
    this.date,
    this.deliveryBy,
    this.deliveryDate,
    this.deliveryStatus,
    this.id,
    this.image,
    this.images,
    this.locationId,
    this.moduleType,
    this.note,
    this.orderDiscount,
    this.orderDiscountId,
    this.orderStatus,
    this.orderTax,
    this.orderTaxId,
    this.projectId,
    this.referenceNo,
    this.rounding,
    this.saleStatus,
    this.salemanBy,
    this.total,
    this.totalItems,
    this.totalTax,
    this.updatedAt,
    this.updatedBy,
    this.warehouseId,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) => SaleModel(
    biller: json["biller"],
    billerId: json["biller_id"],
    createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
    currencyRateKh: json["currency_rate_kh"],
    customer: json["customer"],
    customerId: json["customer_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    deliveryBy: json["delivery_by"],
    deliveryDate: json["delivery_date"] == null ? null : DateTime.parse(json["delivery_date"]),
    deliveryStatus: json["delivery_status"],
    id: json["id"],
    image: json["image"],
    images: json["images"],
    locationId: json["location_id"],
    moduleType: json["module_type"],
    note: json["note"],
    orderDiscount: json["order_discount"],
    orderDiscountId: json["order_discount_id"],
    orderStatus: json["order_status"],
    orderTax: json["order_tax"],
    orderTaxId: json["order_tax_id"],
    projectId: json["project_id"],
    referenceNo: json["reference_no"],
    rounding: json["rounding"],
    saleStatus: json["sale_status"],
    salemanBy: json["saleman_by"],
    total: json["total"],
    totalItems: json["total_items"],
    totalTax: json["total_tax"],
    updatedAt: json["updated_at"],
    updatedBy: json["updated_by"],
    warehouseId: json["warehouse_id"],
  );

  Map<String, dynamic> toJson() => {
    "biller": biller,
    "biller_id": billerId,
    "created_by": createdBy?.toJson(),
    "currency_rate_kh": currencyRateKh,
    "customer": customer,
    "customer_id": customerId,
    "date": date?.toIso8601String(),
    "delivery_by": deliveryBy,
    "delivery_date": deliveryDate?.toIso8601String(),
    "delivery_status": deliveryStatus,
    "id": id,
    "image": image,
    "images": images,
    "location_id": locationId,
    "module_type": moduleType,
    "note": note,
    "order_discount": orderDiscount,
    "order_discount_id": orderDiscountId,
    "order_status": orderStatus,
    "order_tax": orderTax,
    "order_tax_id": orderTaxId,
    "project_id": projectId,
    "reference_no": referenceNo,
    "rounding": rounding,
    "sale_status": saleStatus,
    "saleman_by": salemanBy,
    "total": total,
    "total_items": totalItems,
    "total_tax": totalTax,
    "updated_at": updatedAt,
    "updated_by": updatedBy,
    "warehouse_id": warehouseId,
  };
}

class CreatedBy {
  dynamic avatarUrl;
  String? email;
  String? firstName;
  String? gender;
  String? id;
  String? lastName;
  String? username;

  CreatedBy({
    this.avatarUrl,
    this.email,
    this.firstName,
    this.gender,
    this.id,
    this.lastName,
    this.username,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    avatarUrl: json["avatar_url"],
    email: json["email"],
    firstName: json["first_name"],
    gender: json["gender"],
    id: json["id"],
    lastName: json["last_name"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "email": email,
    "first_name": firstName,
    "gender": gender,
    "id": id,
    "last_name": lastName,
    "username": username,
  };
}
