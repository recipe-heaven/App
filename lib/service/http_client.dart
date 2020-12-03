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

  bool _doAddAuthHeaders = false;

  Future<Map<String, String>> _addAuthHeaders(
      Map<String, String> headers) async {
    _doAddAuthHeaders = false;
    final token = await Storage().getToken();
    var autHeaders = headers;
    if (headers == null) {
      autHeaders = new Map<String, String>();
    }
    autHeaders.addAll({"Authorization": token});
    return autHeaders;
  }

  Future<Map<String, String>> _createHeaders(
      Map<String, String> headers) async {
    if (headers == null) headers = Map();
    var finalHeaders = headers;
    if (_doAddAuthHeaders) {
      finalHeaders = await _addAuthHeaders(headers);
    }
    return finalHeaders;
  }

  /// Flags request for authorization
  HttpServiceClient auth() {
    this._doAddAuthHeaders = true;
    return this;
  }

  Future<http.Response> get(dynamic url, {Map<String, String> headers}) async {
    return _client.get(url, headers: await _createHeaders(headers));
  }

  Future<http.Response> post(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    return _client.post(url,
        headers: await _createHeaders(headers), body: body, encoding: encoding);
  }

  Future<http.Response> put(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    return _client.put(url,
        headers: await _createHeaders(headers), body: body, encoding: encoding);
  }

  Future<http.Response> delete(dynamic url,
      {Map<String, String> headers}) async {
    return _client.delete(url, headers: await _createHeaders(headers));
  }

  Future<http.Response> pathch(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    return _client.patch(url,
        headers: await _createHeaders(headers), body: body, encoding: encoding);
  }
}
