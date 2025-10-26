import 'package:dio/dio.dart';
import 'package:mytravaly/core/constants/constants.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        "authtoken": "71523fdd8d26f585315b4233e39d9263",
        "visitortoken": "7a1f-1c7c-d871-aaf9-5ada-a1a0-abac-ccae",
        'content-type': "application/json",
      },
    );

    _dio = Dio(options);

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  Future<dynamic> getHotels({required Map<String, dynamic> data}) async {
    try {
      // adding action to body so that api can target to hotels list
      Map<String, dynamic> body = {...Constants.getHotelsList, ...data};
      final response = await _dio.post("", data: body);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> getSearchSuggestions({
    required Map<String, dynamic> data,
  }) async {
    try {
      // adding action to body so that api can target to search suggestion
      Map<String, dynamic> body = {...Constants.serchAutoComplete, ...data};
      final response = await _dio.post("", data: body);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<dynamic> getSearchResult({required Map<String, dynamic> data}) async {
    try {
      // adding action to body so that api can target to search result
      Map<String, dynamic> body = {...Constants.getSearchResult, ...data};
      final response = await _dio.post("", data: body);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    if (e.response != null) {
      return 'Error ${e.response?.statusCode}: ${e.response?.data}';
    } else {
      return 'Network Error: ${e.message}';
    }
  }
}
