import 'dart:io';

import 'package:blocwithcleanarchitecture/src/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dio_exceptions.dart';
import 'result.dart';

class DioClient {
  static const int timeOutInSeconds = 50;

  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 10000),
    receiveTimeout: const Duration(milliseconds: 10000),
  );
  late final Dio dio = Dio(options);

  //GET
  Future<Result> get(String? api) async {
    var url = Appconstants.baseUrl + api!;
    // print('API: $url\nToken: ${Appconstants.bearerToken}');

    dio.options.headers['Content-Type'] = Headers.jsonContentType;
    // dio.options.headers["Authorization"] = "Bearer ${Appconstants.bearerToken}";
    // if (Constants.laundryZoneId != null) {
    //   dio.options.headers['zoneId'] = Constants.zoneId;
    //   dio.options.headers['laundryZoneId'] = [Constants.laundryZoneId];
    //   dio.options.headers['storeType'] = "laundry";
    //   dio.options.headers['moduleId'] = Constants.ModuleId;
    // }
    try {
      Response response = await dio.get(
        url,
        options: Options(contentType: Headers.jsonContentType),
      );
      print('Response : ${response.data}');
      return Result.success(response.data);
    } on DioException catch (error) {
      if (error.error != null && error.error is SocketException) {
        print('Error : ${error.message!}');
        return Result.networkError('Please verify your internet connection');
      }
      var errorMessage = DioExceptions.fromDioError(error).toString();
      print('Error : ${error.response?.data.toString()}');
      return Result.error(errorMessage);
    } catch (err) {
      print(err.toString());
      return Result.error(err.toString());
    }
  }

  //POST JSON
  Future<Result> post(String? api, var postMap) async {
    var url = Appconstants.baseUrl + api!;
    dio.options.headers['content-Type'] = Headers.jsonContentType;
    // dio.options.headers["Authorization"] = "Bearer ${Constants.bearerToken}";
    // if (Constants.laundryZoneId != null) {
    //   dio.options.headers['zoneId'] = Constants.zoneId;
    //   dio.options.headers['laundryZoneId'] = [Constants.laundryZoneId];
    //   dio.options.headers['storeType'] = "laundry";
    //   dio.options.headers['moduleId'] = Constants.ModuleId;
    // }

    print('API: $url');
    print('Body: $postMap');

    try {
      Response response = await dio.post(url, data: postMap);
      print("response : ${response.data}");
      return Result.success(response.data);
    } on DioException catch (error) {
      if (error.error != null && error.error is SocketException) {
        print(error.message!);
        return Result.networkError('Please verify your internet connection');
      }

      var errorMessage = DioExceptions.fromDioError(error).toString();
      debugPrint(error.message);
      return Result.error(errorMessage);
    } catch (err) {
      print(err.toString());
      return Result.error(err.toString());
    }
  }

  //POST JSON
  Future<Result> put(String? api, var postMap) async {
    var url = Appconstants.baseUrl + api!;
    dio.options.headers['content-Type'] = Headers.jsonContentType;
    // dio.options.headers["Authorization"] = "Bearer ${Constants.bearerToken}";
    // if (Constants.laundryZoneId != null) {
    //   dio.options.headers['zoneId'] = Constants.zoneId;
    //   dio.options.headers['laundryZoneId'] = [Constants.laundryZoneId];
    //   dio.options.headers['storeType'] = "laundry";
    //   dio.options.headers['moduleId'] = Constants.ModuleId;
    // }

    print('API: $url');
    print('Body: $postMap');

    try {
      Response response = await dio.put(url, data: postMap);
      print("response : ${response.data}");
      return Result.success(response.data);
    } on DioException catch (error) {
      if (error.error != null && error.error is SocketException) {
        print(error.message!);
        return Result.networkError('Please verify your internet connection');
      }

      var errorMessage = DioExceptions.fromDioError(error).toString();
      debugPrint(error.message);
      return Result.error(errorMessage);
    } catch (err) {
      print(err.toString());
      return Result.error(err.toString());
    }
  }
}
