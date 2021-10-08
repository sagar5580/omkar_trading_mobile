import 'package:json_annotation/json_annotation.dart';

part 'our_branche_model.g.dart';

@JsonSerializable()
class OurBranchesResponse {
  @JsonKey(name: "data")
  List<OurBranchesData>? data;

  OurBranchesResponse({this.data});

  factory OurBranchesResponse.fromJson(Map<String, dynamic> json) =>
      _$OurBranchesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OurBranchesResponseToJson(this);
}

@JsonSerializable()
class OurBranchesData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "contact")
  String? contact;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "city")
  String? city;

  OurBranchesData({
    this.id,
    this.name,
    this.contact,
    this.address,
    this.state,
    this.city,
  });

  factory OurBranchesData.fromJson(Map<String, dynamic> json) =>
      _$OurBranchesDataFromJson(json);

  Map<String, dynamic> toJson() => _$OurBranchesDataToJson(this);
}
