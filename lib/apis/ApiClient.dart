import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youtube/models/employee/employee_checkin.dart';
import 'package:youtube/models/employee/employee_model.dart';
import 'package:youtube/utils/utils.dart';
part 'ApiClient.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // get employee list
  @GET("employee")
  Future<List<EmployeeModel>> getEmployees(
      @Queries() Map<String, dynamic> queries);
  //get employee detail by id
  @GET("employee/{id}")
  Future<EmployeeModel> getEmployeeDetail(@Path("id") String id);
  //get employee checkin list
  @GET("employee/{id}/checkin")
  Future<List<EmployeeCheckin>> getEmployeeCheckin(@Path("id") String id);
}
