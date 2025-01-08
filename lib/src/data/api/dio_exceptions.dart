import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String? message;

  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.error is SocketException) {
      message = 'Please verify your internet connection';
      return;
    }

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;

      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    if (error != null && error is Map) {
      final parsedJson = error as Map<String, dynamic>;

      if (parsedJson.containsKey('error')) {
        return parsedJson['error'] is String
            ? parsedJson['error']
            : parsedJson['error'].first['msg'].toString();
      }
    }

    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error.containsKey('message')
            ? error['message'].toString()
            : 'Not found';

      case 500:
        return 'Internal server error';
      case 503:
        return 'Service unavailable';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
