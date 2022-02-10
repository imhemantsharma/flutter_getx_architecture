import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class RestClient extends GetConnect {
  static const Duration defaultTimeOut =
      Duration(seconds: kDebugMode ? 30 : 45);

  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
    httpClient.timeout = defaultTimeOut;

    /// Logger in debug mode
    if (kDebugMode) {
      _addLogger();
    }

    /// It will attach default header to all api call's
    /* httpClient.addRequestModifier<dynamic>((request) async {
      var headers = await getHeaders();
      headers.forEach((key, value) {
        if (!request.headers.containsKey(key)) {
          request.headers[key] = value;
        }
      });

      return request;
    });*/

    /// Add Authentication
    /*httpClient.addAuthenticator<dynamic>((request) async {
      /// verify & update token
      String? token = await getToken();
      if (token != null) {
        request.headers['authorization'] = token;
      }
      return request;
    });*/
  }

  void _addLogger() {
    httpClient.addResponseModifier((request, response) {
      printInfo(
          info: 'GetConnect request -->{'
              'method: ${request.method},'
              'url :  ${request.url},'
              'headers: ${request.headers},'
              'body: ${request.bodyBytes.toString()}}');
      printInfo(
          info: 'GetConnect response -->{'
              'httpcode : ${response.status.code},'
              'status: ${response.status.isOk},'
              'header : ${response.headers},'
              'body ${response.bodyString}}');
      return response;
    });
  }
}
