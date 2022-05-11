import 'package:dio/dio.dart';
import 'package:youtube/apis/ApiClient.dart';
import 'package:youtube/models/ServerError.dart';
import 'package:youtube/models/employee/employee_checkin.dart';
import 'package:youtube/models/employee/employee_model.dart';
import 'package:youtube/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  late Dio dio;
  late ApiClient apiClient;
  EmployeeRepositoryImpl() {
    dio = Dio();
    //dio.options.headers["Content-Type"] = "application/json";
    //dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(LogInterceptor(
      //responseBody: true,
      request: true,
      //requestBody: true,
    ));
    apiClient = ApiClient(dio);
  }

  @override
  Future<EmployeeModel> loadEmployeeDetail(String empId) async {
    late EmployeeModel employeeetail;
    try {
      employeeetail = await apiClient.getEmployeeDetail(empId);
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return employeeetail;
  }

  @override
  Future<List<EmployeeModel>> loadEmployees(
      int page, int limit, String? name) async {
    late List<EmployeeModel> employees;
    try {
      //page=1&limit=10sortBy=createdAt&order=desc
      Map<String, dynamic> queries = {
        "page": page,
        "limit": limit,
        "sortBy": "createdAt",
        "order": "desc"
      };
      queries["name"] = name ?? "";
      employees = await apiClient.getEmployees(queries);
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return employees;
  }

  @override
  Future<List<EmployeeCheckin>> loadEmployeeCheckins(String empId) async {
    late List<EmployeeCheckin> employeesChekin;
    try {
      employeesChekin = await apiClient.getEmployeeCheckin(empId);
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return employeesChekin;
  }
}
