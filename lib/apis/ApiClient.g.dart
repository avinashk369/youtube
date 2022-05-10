// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://620dfdda20ac3a4eedcf5a52.mockapi.io/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<EmployeeModel>> getEmployees(queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EmployeeModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'employee',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => EmployeeModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<EmployeeModel> getEmployeeDetail(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EmployeeModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'employee/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EmployeeModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<EmployeeCheckin>> getEmployeeCheckin(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EmployeeCheckin>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'employee/${id}/checkin',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => EmployeeCheckin.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
