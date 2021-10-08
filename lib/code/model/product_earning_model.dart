import 'package:json_annotation/json_annotation.dart';

part "product_earning_model.g.dart";

@JsonSerializable()
class EarningResponse {
  @JsonKey(name: "data")
  List<EarningData>? data;

  EarningResponse({
    this.data,
  });

  factory EarningResponse.fromJson(Map<String, dynamic> json) =>
      _$EarningResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EarningResponseToJson(this);
}

@JsonSerializable()
class EarningData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "refer")
  Refer? refer;
  @JsonKey(name: "referPercentage")
  int? referPercentage;
  @JsonKey(name: "refer_amount")
  int? referAmount;
  @JsonKey(name: "product")
  Product? product;

  EarningData({
    this.id,
    this.refer,
    this.referPercentage,
    this.referAmount,
    this.product,
  });

  factory EarningData.fromJson(Map<String, dynamic> json) =>
      _$EarningDataFromJson(json);

  Map<String, dynamic> toJson() => _$EarningDataToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "imagesUrl")
  List<String>? imagesUrl;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imagesUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Refer {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "referId")
  int? referId;
  @JsonKey(name: "referEarning")
  dynamic referEarning;
  @JsonKey(name: "referAmount")
  int? referAmount;

  Refer({
    this.id,
    this.name,
    this.referId,
    this.referEarning,
    this.referAmount,
  });

  factory Refer.fromJson(Map<String, dynamic> json) => _$ReferFromJson(json);

  Map<String, dynamic> toJson() => _$ReferToJson(this);
}

// class Pagination {
//   Pagination({
//     this.perPage,
//     this.items,
//     this.from,
//     this.to,
//     this.next,
//     this.currentPage,
//     this.totalPages,
//     this.totalCount,
//   });
//
//   int perPage;
//   int items;
//   int from;
//   int to;
//   dynamic next;
//   int currentPage;
//   int totalPages;
//   int totalCount;
//
//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//     perPage: json["per_page"],
//     items: json["items"],
//     from: json["from"],
//     to: json["to"],
//     next: json["next"],
//     currentPage: json["current_page"],
//     totalPages: json["total_pages"],
//     totalCount: json["total_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "per_page": perPage,
//     "items": items,
//     "from": from,
//     "to": to,
//     "next": next,
//     "current_page": currentPage,
//     "total_pages": totalPages,
//     "total_count": totalCount,
//   };
// }
