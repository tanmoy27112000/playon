import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://fantasy-stage-api.formula1.com/partner_games/f1/";

Future getRequest(String path) async {
  final response = await http.get(
    Uri.parse("$baseUrl$path"),
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    Get.snackbar("Failed to get data from $path", "");
    return {"status": false, "message": "Failed to load data from $path"};
  }
}

Future postRequest(String path, {Map? data}) async {
  final response = await http.post(
    Uri.parse("$baseUrl$path"),
    body: jsonEncode(data),
    headers: {HttpHeaders.contentTypeHeader: "application/json"},
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    Get.snackbar("Failed to get data from $path", "");
    return {"status": false, "message": "Failed to load data from $path"};
  }
}
