import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:food_app/core/const_key_secret.dart';
import 'api_response.dart';
import 'end_points.dart';

class ApiHelper {
  ApiHelper._internal();

  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() {
    return _instance;
  }

  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Path: ${options.path}');
          log('Method: ${options.method}');
          log('Headers: ${options.headers}');
          log('Data: ${options.data}');
          return handler.next(options);
        },
      ),
    );



//postDio
  Future<ApiResponse> postDioRequest({
    required dynamic body,
    required String endpoint,
    String? contentType,
    Map<String, dynamic>? headers,
    bool expectStatusKey = true,
  }) async {
    try {
      var response = await dio.post(
        "${EndPoints.baseUrl}$endpoint",
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $cardToken"},
        ),
      );

      return expectStatusKey
          ? ApiResponse.fromResponse(response)
          : ApiResponse(
        status: true,
        statusCode: response.statusCode ?? 200,
        data: response.data,
        message: 'Success',
      );
    } on DioException catch (e) {
      return ApiResponse.fromError(e);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

}
