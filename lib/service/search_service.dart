import 'dart:convert';
import 'dart:io';
import 'package:App/pages/explore/result.dart';
import 'package:App/pages/explore/search_options.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';

class SearchService {
  final Http httpClient;

  SearchService(this.httpClient);

  Future<Result> search(SearchOptions options) async {
    try {
      var response = await httpClient.post(searchEndpoint,
          headers: {'Content-type': "application/json"},
          body: options.toJsonString());
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
          return Result.fromJson(body["data"]);
        }
      } else {
        return null;
      }
    } on IOException catch (e) {
      print(e);
    }
    return null;
  }
}
