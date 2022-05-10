// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCheckin _$EmployeeCheckinFromJson(Map<String, dynamic> json) =>
    EmployeeCheckin()
      ..checkin = json['checkin'] as String?
      ..location = json['location'] as String?
      ..purpose = json['purpose'] as String?
      ..id = json['id'] as String?
      ..employeeId = json['employee_id'] as String?;

Map<String, dynamic> _$EmployeeCheckinToJson(EmployeeCheckin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('checkin', instance.checkin);
  writeNotNull('location', instance.location);
  writeNotNull('purpose', instance.purpose);
  writeNotNull('id', instance.id);
  writeNotNull('employee_id', instance.employeeId);
  return val;
}
