import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exceptions.dart';

import 'BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getAPiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }
  
  @override
  Future getPostApiResponse(String url, dynamic data) async{
    
    dynamic responseJson;
  try {
    Response response = await
        post(Uri.parse(url), body: data)
        .timeout(Duration(seconds: 10));
              responseJson = returnResponse(response);

  } on SocketException {
    throw FetchDataException('No internet Connection');
  }
  return responseJson;
  }
}


dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);

      return responseJson;

    case 400:
      throw BadRequestException(response.body.toString());

    case 404:
      throw UnauthorisedException(response.body.toString());

    default:
      throw FetchDataException(
          "Error occured while communcating with server. Error code: " +
              response.statusCode.toString());
  }
}
