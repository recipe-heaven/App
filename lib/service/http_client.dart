import 'dart:convert';

import 'package:http/http.dart' as http;

//
abstract class Http {
  Future<http.Response> get(dynamic url, {Map<String, String> headers});

  Future<http.Response> post(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding});

  Future<http.Response> put(dynamic url,
      {Map<String, String> headers,
      Map<String, String> body,
      Encoding encoding});
  Future<http.Response> delete(dynamic url, {Map<String, String> headers});

  Future<http.Response> pathch(dynamic url,
      {Map<String, String> headers,
      Map<String, String> body,
      Encoding encoding});
}

/// Resposible for performing HTTP requests to a server
class HttpClient implements Http {
  final _client = http.Client();

  Future<http.Response> get(dynamic url, {Map<String, String> headers}) {
    return _client.get(url, headers: headers);
  }

  Future<http.Response> post(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) {
    return _client.post(url, headers: headers, body: body, encoding: encoding);
  }

  Future<http.Response> put(dynamic url,
      {Map<String, String> headers,
      Map<String, String> body,
      Encoding encoding}) {
    return _client.put(url, headers: headers, body: body, encoding: encoding);
  }

  Future<http.Response> delete(dynamic url, {Map<String, String> headers}) {
    return _client.delete(url, headers: headers);
  }

  Future<http.Response> pathch(dynamic url,
      {Map<String, String> headers,
      Map<String, String> body,
      Encoding encoding}) {
    return _client.patch(url, headers: headers, body: body, encoding: encoding);
  }
}
