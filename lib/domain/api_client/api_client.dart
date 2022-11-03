import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/enviroment.dart';



enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  dynamic error;
  ApiClientException(this.type, [this.error]);
}


class ApiClient {
  final String _host = Enviroment.apiUrl;
  final _sessionDataProvider = SessionDataProvider();

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  // void _validateResponse(Response response) {
  //   print(response);
  //   // if (response.statusCode == 401) {
  //   //   final dynamic status = json['status_code'];
  //   //   final code = status is int ? status : 0;
  //   //   if (code == 30) {
  //   //     throw ApiClientException(ApiClientExceptionType.auth);
  //   //   } else {
  //   //     throw ApiClientException(ApiClientExceptionType.other);
  //   //   }
  //   // }
  // }

  Future<T> postRequest<T>(
    String path,
    Map<String, dynamic>? bodyParameters, [
    Map<String, dynamic>? parameters,
  ]) async {
    try {
      final String? token = await _sessionDataProvider.getToken();
      final url = _makeUri(path, parameters);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-CSRFToken": token ?? ''
      };
      final Response response = await http.post(url,
          body: json.encode(bodyParameters), headers: headers);
    
      final result = await jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200) {
        throw result;
      }
      return result;

    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other,e);
    } finally {
    }
  }

    Future<T> getRequest<T>(
    String path, [
    Map<String, dynamic>? parameters,
  ]) async {
    try {
      print(_host);
      final String? token = await _sessionDataProvider.getToken();
      final url = _makeUri(path, parameters);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-CSRFToken": token ?? '',
        "Authorization": "Token ${token ?? ''}"
      };
      final response = await http.get(url, headers: headers);
      final result = await jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200) {
        throw result;
      }
      return result;

    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other,e);
    } finally {
    }
  }
}


extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}