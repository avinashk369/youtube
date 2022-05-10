import 'package:dio/dio.dart';
import 'package:youtube/apis/ApiClient.dart';
import 'package:youtube/models/ServerError.dart';
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
      responseBody: true,
      request: true,
      requestBody: true,
    ));
    apiClient = ApiClient(dio);
  }

  @override
  Future<EmployeeModel> loadEmployeeDetail(String empId) async {
    late EmployeeModel employeeetail;
    try {
      employeeetail = await apiClient.getEmployeeDetail();
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return employeeetail;
  }

  @override
  Future<List<EmployeeModel>> loadEmployees() async {
    late List<EmployeeModel> employees;
    try {
      employees = await apiClient.getEmployees();
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return employees;
  }
}
