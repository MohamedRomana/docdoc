import 'package:json_annotation/json_annotation.dart';
part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: 'data')
  final List<SpecializationData?>? specializations;

  SpecializationResponseModel({this.specializations});

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  final int? id;
  final String? name;
  @JsonKey(name: 'doctors')
  final List<DoctorsList?>? doctorsList;

  SpecializationData({this.id, this.name, this.doctorsList});

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class DoctorsList {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  @JsonKey(name: 'appoint_price')
  final int? price;
  final String? description;
  final String? degree;

  DoctorsList({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.description,
    this.degree,
    this.price,
  });

  factory DoctorsList.fromJson(Map<String, dynamic> json) =>
      _$DoctorsListFromJson(json);
}
