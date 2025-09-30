import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/web.dart';

class Apicaller {
  static final Logger _logger = Logger();

  static void _logrequest(String url, [Map<String, dynamic>? body]) {
    _logger.i('URL => $url\nRequest Body: $body');
  }

  static void _logresponse(String url, Response response) {
    _logger.i(
      'URL => $url\nStatus Code: ${response.statusCode}\nBody: ${response.body}',
    );
  }

  static Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logrequest(url, null); // fix: added null for body
      Response response = await get(uri);
      _logresponse(url, response);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucess: true,
          responsecode: response.statusCode,
          responsedata: decodedData,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucess: false,
          responsecode: response.statusCode,
          responsedata: decodedData,
          errormassage: "Request failed with status ${response.statusCode}",
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSucess: false,
        responsecode: -1,
        responsedata: null,
        errormassage: e.toString(),
      );
    }
  }

  static Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logrequest(url, body); // fix: log with body
      Response response = await post(
        uri,
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(body),
      ); // fix: pass body
      _logresponse(url, response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucess: true,
          responsecode: response.statusCode,
          responsedata: decodedData,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSucess: false,
          responsecode: response.statusCode,
          responsedata: decodedData,
          errormassage: "Request failed with status ${response.statusCode}",
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSucess: false,
        responsecode: -1,
        responsedata: null,
        errormassage: e.toString(),
      );
    }
  }
}

class ApiResponse {
  final bool isSucess;
  final int responsecode;
  final dynamic responsedata;
  final String? errormassage;

  ApiResponse({
    required this.isSucess,
    required this.responsecode,
    required this.responsedata,
    this.errormassage = 'Something Went Wrong',
  });
}
