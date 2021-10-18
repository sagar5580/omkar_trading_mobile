import 'package:json_annotation/json_annotation.dart';
import 'package:omkar_trading/code/model/testimonials_model.dart';
import 'package:omkar_trading/code/model/pagination_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "data")
  List<ProductData>? data;
  @JsonKey(name: "pagination")
  PaginationResponse? paginationResponse;

  ProductResponse({this.data, this.paginationResponse});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "images_url")
  List<String>? imageUrl;
  @JsonKey(name: "testimonals")
  List<TestimonialsData>? testimonials;

  ProductData(
      {this.id,
      this.name,
      this.imageUrl,
      this.description,
      this.price,
      this.testimonials});

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
