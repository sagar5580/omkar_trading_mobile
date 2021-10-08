import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class PaginationResponse {
  @JsonKey(name: "per_page")
  int? per_page;
  @JsonKey(name: "items")
  int? items;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "next")
  int? next;
  @JsonKey(name: "current_page")
  int? current_page;
  @JsonKey(name: "total_pages")
  int? total_pages;
  @JsonKey(name: "total_count")
  int? total_count;

  PaginationResponse(
      {this.per_page,
      this.items,
      this.from,
      this.to,
      this.next,
      this.current_page,
      this.total_pages,
      this.total_count});

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}
