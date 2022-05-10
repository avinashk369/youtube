import 'package:json_annotation/json_annotation.dart';
part 'employee_checkin.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class EmployeeCheckin {
  String? checkin;
  String? location;
  String? purpose;
  String? id;
  String? employeeId;
  EmployeeCheckin();
  factory EmployeeCheckin.fromJson(Map<String, dynamic> json) =>
      _$EmployeeCheckinFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeCheckinToJson(this);
}
