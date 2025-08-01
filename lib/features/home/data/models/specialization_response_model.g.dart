// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'specialization_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponseModel _$SpecializationResponseModelFromJson(
  Map<String, dynamic> json,
) => SpecializationResponseModel(
  specializations: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : SpecializationData.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$SpecializationResponseModelToJson(
  SpecializationResponseModel instance,
) => <String, dynamic>{'data': instance.specializations};

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      doctorsList: (json['doctors'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : DoctorsList.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctorsList,
    };

DoctorsList _$DoctorsListFromJson(Map<String, dynamic> json) => DoctorsList(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  gender: json['gender'] as String?,
  description: json['description'] as String?,
  degree: json['degree'] as String?,
  price: (json['appoint_price'] as num?)?.toInt(),
);

Map<String, dynamic> _$DoctorsListToJson(DoctorsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'appoint_price': instance.price,
      'description': instance.description,
      'degree': instance.degree,
    };
