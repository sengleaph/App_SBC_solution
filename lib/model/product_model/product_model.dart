// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<ProductData>? data;
  Meta? meta;

  ProductModel({
    this.data,
    this.meta,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    data: json["data"] == null ? [] : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class ProductData {
  List<dynamic>? addonItems;
  String? barcode;
  String? barcodeSymbology;
  dynamic brand;
  String? category;
  String? code;
  List<dynamic>? comboItems;
  String? cost;
  String? currency;
  String? defCost;
  String? defPrice;
  String? defPunit;
  String? defSunit;
  String? details;
  String? id;
  String? image;
  String? maxSerial;
  String? name;
  String? netPrice;
  String? price;
  String? purchaseUnit;
  String? qrcode;
  String? quantity;
  String? saleUnit;
  dynamic serialNo;
  String? slug;
  String? taxMethod;
  TaxRate? taxRate;
  String? type;
  Unit? unit;
  String? unitPrice;
  int? unitQuantity;

  ProductData({
    this.addonItems,
    this.barcode,
    this.barcodeSymbology,
    this.brand,
    this.category,
    this.code,
    this.comboItems,
    this.cost,
    this.currency,
    this.defCost,
    this.defPrice,
    this.defPunit,
    this.defSunit,
    this.details,
    this.id,
    this.image,
    this.maxSerial,
    this.name,
    this.netPrice,
    this.price,
    this.purchaseUnit,
    this.qrcode,
    this.quantity,
    this.saleUnit,
    this.serialNo,
    this.slug,
    this.taxMethod,
    this.taxRate,
    this.type,
    this.unit,
    this.unitPrice,
    this.unitQuantity,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    addonItems: json["addon_items"] == null ? [] : List<dynamic>.from(json["addon_items"]!.map((x) => x)),
    barcode: json["barcode"],
    barcodeSymbology: json["barcode_symbology"],
    brand: json["brand"],
    category: json["category"],
    code: json["code"],
    comboItems: json["combo_items"] == null ? [] : List<dynamic>.from(json["combo_items"]!.map((x) => x)),
    cost: json["cost"],
    currency: json["currency"],
    defCost: json["def_cost"],
    defPrice: json["def_price"],
    defPunit: json["def_punit"],
    defSunit: json["def_sunit"],
    details: json["details"],
    id: json["id"],
    image: json["image"],
    maxSerial: json["max_serial"],
    name: json["name"],
    netPrice: json["net_price"],
    price: json["price"],
    purchaseUnit: json["purchase_unit"],
    qrcode: json["qrcode"],
    quantity: json["quantity"],
    saleUnit: json["sale_unit"],
    serialNo: json["serial_no"],
    slug: json["slug"],
    taxMethod: json["tax_method"],
    taxRate: json["tax_rate"] == null ? null : TaxRate.fromJson(json["tax_rate"]),
    type: json["type"],
    unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
    unitPrice: json["unit_price"],
    unitQuantity: json["unit_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "addon_items": addonItems == null ? [] : List<dynamic>.from(addonItems!.map((x) => x)),
    "barcode": barcode,
    "barcode_symbology": barcodeSymbology,
    "brand": brand,
    "category": category,
    "code": code,
    "combo_items": comboItems == null ? [] : List<dynamic>.from(comboItems!.map((x) => x)),
    "cost": cost,
    "currency": currency,
    "def_cost": defCost,
    "def_price": defPrice,
    "def_punit": defPunit,
    "def_sunit": defSunit,
    "details": details,
    "id": id,
    "image": image,
    "max_serial": maxSerial,
    "name": name,
    "net_price": netPrice,
    "price": price,
    "purchase_unit": purchaseUnit,
    "qrcode": qrcode,
    "quantity": quantity,
    "sale_unit": saleUnit,
    "serial_no": serialNo,
    "slug": slug,
    "tax_method": taxMethod,
    "tax_rate": taxRate?.toJson(),
    "type": type,
    "unit": unit?.toJson(),
    "unit_price": unitPrice,
    "unit_quantity": unitQuantity,
  };
}

class TaxRate {
  String? id;
  String? name;
  String? code;
  String? rate;
  String? type;

  TaxRate({
    this.id,
    this.name,
    this.code,
    this.rate,
    this.type,
  });

  factory TaxRate.fromJson(Map<String, dynamic> json) => TaxRate(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    rate: json["rate"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "rate": rate,
    "type": type,
  };
}

class Unit {
  String? id;
  String? code;
  String? name;
  dynamic baseUnit;
  dynamic unitOperator;
  dynamic unitValue;
  dynamic operationValue;

  Unit({
    this.id,
    this.code,
    this.name,
    this.baseUnit,
    this.unitOperator,
    this.unitValue,
    this.operationValue,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    baseUnit: json["base_unit"],
    unitOperator: json["operator"],
    unitValue: json["unit_value"],
    operationValue: json["operation_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "base_unit": baseUnit,
    "operator": unitOperator,
    "unit_value": unitValue,
    "operation_value": operationValue,
  };
}

class Meta {
  int? start;
  int? limit;
  int? totalRows;
  int? totalPages;

  Meta({
    this.start,
    this.limit,
    this.totalRows,
    this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    start: json["start"],
    limit: json["limit"],
    totalRows: json["totalRows"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "limit": limit,
    "totalRows": totalRows,
    "totalPages": totalPages,
  };
}
