import 'package:json_annotation/json_annotation.dart';
import 'package:omkar_trading/code/model/product_model.dart';

part 'testimonials_model.g.dart';

@JsonSerializable()
class TestimonialsResponse {
  @JsonKey(name: "data")
  List<TestimonialsData>? data;

  TestimonialsResponse({this.data});

  factory TestimonialsResponse.fromJson(Map<String, dynamic> json) =>
      _$TestimonialsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TestimonialsResponseToJson(this);
}

@JsonSerializable()
class TestimonialsData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "rate")
  int? rate;
  @JsonKey(name: "image_url")
  String? imageUrl;
  @JsonKey(name: "product")
  ProductData? productData;

  TestimonialsData({
    this.id,
    this.name,
    this.rate,
    this.imageUrl,
    this.productData,
  });

  factory TestimonialsData.fromJson(Map<String, dynamic> json) =>
      _$TestimonialsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TestimonialsDataToJson(this);
}
