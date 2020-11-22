import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:App/store/store.dart';

//
abstract class Http {
  Future<http.Response> get(dynamic url, {Map<String, String> headers});

  Future<http.Response> post(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding});

  Future<http.Response> put(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding});
  Future<http.Response> delete(dynamic url, {Map<String, String> headers});

  Future<http.Response> pathch(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding});
}

/// Resposible for performing HTTP requests to a server
class HttpServiceClient implements Http {
  final _client = http.Client();

  Future<Map<String, String>> _addAuthHeaders(
      Map<String, String> headers) async {
    final token = await Storage().getToken();
    var autHeaders = headers;
    if (headers == null) {
      autHeaders = new Map<String, String>();
    }
    autHeaders.addAll({"Authorization": token});
    return autHeaders;
  }

  Future<http.Response> get(dynamic url,
      {Map<String, String> headers, bool addAuth = false}) async {
    var finalHeaders = headers;
    if (addAuth) {
      finalHeaders = await _addAuthHeaders(headers);
    }

    return _client.get(url, headers: finalHeaders);
  }

  Future<http.Response> post(dynamic url,
      {Map<String, String> headers,
      dynamic body,
      Encoding encoding,
      bool addAuth = false}) async {
    var finalHeaders = headers;
    if (addAuth) {
      finalHeaders = await _addAuthHeaders(headers);
    }
    return _client.post(url,
        headers: finalHeaders, body: body, encoding: encoding);
  }

  Future<http.Response> put(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) {
    return _client.put(url, headers: headers, body: body, encoding: encoding);
  }

  Future<http.Response> delete(dynamic url, {Map<String, String> headers}) {
    return _client.delete(url, headers: headers);
  }

  Future<http.Response> pathch(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) {
    return _client.patch(url, headers: headers, body: body, encoding: encoding);
  }
}
