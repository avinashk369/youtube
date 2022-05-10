import 'package:youtube/models/employee/employee_model.dart';

abstract class EmployeeRepository {
  Future<List<EmployeeModel>> loadEmployees();
  Future<EmployeeModel> loadEmployeeDetail(String empId);
}
