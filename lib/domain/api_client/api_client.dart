import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/enviroment.dart';
import 'package:http_parser/http_parser.dart';

enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  dynamic error;
  ApiClientException(this.type, [this.error]);
}

abstract class ReqestType {
  static const post = 'post';
  static const put = 'put';
  static const patch = 'patch';
}

class ApiClient {
  static final String _host = Enviroment.apiUrl;
  static final _sessionDataProvider = SessionDataProvider();

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<Response> _response(String method, Uri uri,
      Map<String, String>? headers, Object? bodyParameters) async {
    switch (method) {
      case ReqestType.post:
        {
          final Response response = await http.post(uri,
              body: json.encode(bodyParameters), headers: headers);
          return response;
        }
      case ReqestType.patch:
        {
          final Response response = await http.patch(uri,
              body: json.encode(bodyParameters), headers: headers);
          return response;
        }
      case ReqestType.put:
        {
          final Response response = await http.put(uri,
              body: json.encode(bodyParameters), headers: headers);
          return response;
        }
      default:
        {
          final Response response = await http.post(uri,
              body: json.encode(bodyParameters), headers: headers);
          return response;
        }
    }
  }

  Future<T> makeRequest<T>(
    String method,
    String path,
    Map<String, dynamic>? bodyParameters, [
    Map<String, dynamic>? parameters,
  ]) async {
    try {
      final String? token = await _sessionDataProvider.getToken();
      final url = _makeUri(path, parameters);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-CSRFToken": token ?? '',
        "Authorization": token != null ? 'Token $token' : ''
      };

      // final Response response = await http.post(url,
      //     body: json.encode(bodyParameters), headers: headers);

      final Response response = await _response(method, url, headers, bodyParameters);

      final result = await jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw result;
      }
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other, e);
    } finally {}
  }

  Future<T> uploadFileToServer<T>(
    String path,
    Map<String, dynamic>? bodyParameters, [
    Map<String, dynamic>? parameters,
  ]) async {
    try {
      final String? token = await _sessionDataProvider.getToken();
      final url = _makeUri(path, parameters);

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-CSRFToken": token ?? '',
        "Authorization": token != null ? 'Token $token' : ''
      };
      if (bodyParameters != null && bodyParameters.containsKey('file')) {
        headers['Content-Type'] = 'multipart/form-data';
      }
      XFile file = bodyParameters!['file'];
      var request = http.MultipartRequest("POST", url)..headers.addAll(headers);
      request.fields.addAll(
          {'title': bodyParameters['title'], 'name': bodyParameters['name']});
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: MediaType('application', 'image/jpeg'),
      ));

      final Response response =
          await http.Response.fromStream(await request.send());

      final result = await jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw result;
      }
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other, e);
    } finally {}
  }

  Future<Response> getRequest<T>(
    String path, [
    Map<String, dynamic>? parameters,
  ]) async {
    try {
      final String? token = await _sessionDataProvider.getToken();
      final url = _makeUri(path, parameters);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-CSRFToken": token ?? '',
        "Authorization": token != null ? 'Token $token' : ''
      };
      final response = await http.get(url, headers: headers);
      // final result = await jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode != 200) {
        throw response;
      }
      return response;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other, e);
    }
     finally {}
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
