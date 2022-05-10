import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youtube/models/employee/employee_model.dart';
import 'package:youtube/utils/utils.dart';
part 'ApiClient.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("employee")
  Future<List<EmployeeModel>> getEmployees();
  @GET("Home/HomeFeaturesData")
  Future<EmployeeModel> getEmployeeDetail();
}
