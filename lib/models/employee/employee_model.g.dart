// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel()
      ..createdAt = json['created_at'] as String?
      ..name = json['name'] as String?
      ..avatar = json['avatar'] as String?
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?
      ..department = (json['department'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..birthday = json['birthday'] as String?
      ..country = json['country'] as String?
      ..id = json['id'] as String?;

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_at', instance.createdAt);
  writeNotNull('name', instance.name);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('department', instance.department);
  writeNotNull('birthday', instance.birthday);
  writeNotNull('country', instance.country);
  writeNotNull('id', instance.id);
  return val;
}
