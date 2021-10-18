import 'package:json_annotation/json_annotation.dart';
import 'package:omkar_trading/code/model/product_model.dart';
import 'package:omkar_trading/code/model/pagination_model.dart';

part 'order_product_model.g.dart';

@JsonSerializable()
class OrderProductModel {
  @JsonKey(name: "data")
  List<OrderProductData>? data;
  @JsonKey(name: "pagination")
  PaginationResponse? paginationResponse;

  OrderProductModel({this.data, this.paginationResponse});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductModelToJson(this);
}

@JsonSerializable()
class OrderProductData {
  @JsonKey(name: "order_date")
  String? order_date;
  @JsonKey(name: "product")
  ProductData? productData;

  OrderProductData({this.order_date, this.productData});

  factory OrderProductData.fromJson(Map<String, dynamic> json) =>
      _$OrderProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductDataToJson(this);
}
