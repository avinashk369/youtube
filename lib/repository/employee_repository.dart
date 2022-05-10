import 'package:youtube/models/employee/employee_checkin.dart';
import 'package:youtube/models/employee/employee_model.dart';

abstract class EmployeeRepository {
  Future<List<EmployeeModel>> loadEmployees(int page, int limit, String? name);
  Future<EmployeeModel> loadEmployeeDetail(String empId);
  Future<List<EmployeeCheckin>> loadEmployeeCheckins(String empId);
}
