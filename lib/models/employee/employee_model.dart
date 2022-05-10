import 'package:json_annotation/json_annotation.dart';
part 'employee_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class EmployeeModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? email;
  String? phone;
  List<String>? department;
  String? birthday;
  String? country;
  String? id;
  EmployeeModel();
  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
