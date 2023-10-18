import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'endpoint.dart' as endpoint;

part 'main_repo.g.dart';

@RestApi()
abstract class MainRepository {
  factory MainRepository(
    Dio dio, {
    String baseUrl,
  }) = _MainRepository;
}

extension ApiClientHandleError on MainRepository {
  String mapDioErrorToMessage(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return 'Connection timeout';
      case DioErrorType.response:
        // Parsing error response to string error
        if (error.response != null) {
          final res = error.response;
          if (res?.data != null) {
            try {
              //final response = NoDataResponse.fromJson(res?.data);
              return "error"; //response.message;
            } catch (e) {
              return 'Common error (${res?.statusCode ?? ''})';
            }
          }
          return 'Common error (${res?.statusCode ?? ''})';
        }
        return 'Common error (${error.toString()})';
      case DioErrorType.cancel:
        return 'Request was cancelled unexpectedly';
      case DioErrorType.other:
        return error.message;
    }
  }
}
