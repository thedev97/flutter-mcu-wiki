import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import '../app_exceptions.dart';
import 'base_api_response.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic resJson;
    try {
      var response = await http.get(Uri.parse(url)).timeout(10.seconds);
      resJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeout {
      throw RequestTimeout('Request is out of time');
    }
    return resJson;
  }

  @override
  Future<dynamic> postApi(data, String url) async {
    dynamic resJson;
    try {
      var response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(10.seconds);
      resJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeout {
      throw RequestTimeout('Request is out of time');
    }
    return resJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic resJson = jsonDecode(response.body);
        return resJson;
      case 400:
        throw InvalidUrlException('Invalid Url');
      default:
        throw FetchDataException(
            'Error occurred while connecting with server ${response.statusCode}');
    }
  }
}
