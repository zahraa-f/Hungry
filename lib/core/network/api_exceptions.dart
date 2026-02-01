import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiExceptions {

  static ApiError handleError(DioError error){
    switch (error.type){
      case DioException.connectionTimeout:
      return ApiError(message: "Bad connection");
      case DioException.badResponse:
      return ApiError(message: error.toString());
      default:
      return ApiError(message: "Something went wrong");
    }
  }
}