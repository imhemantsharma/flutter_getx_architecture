import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_getx_architecture/app/network/dio_provider.dart';
import 'package:flutter_getx_architecture/app/network/error_handlers.dart';
import 'package:flutter_getx_architecture/app/network/exceptions/base_exception.dart';


abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;
      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      if (kDebugMode) {
        print("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      }
      throw exception;
    } catch (error) {
      if (kDebugMode) {
        print("Generic error: >>>>>>> $error");
      }

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
