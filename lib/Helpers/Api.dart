import 'dart:convert';

import 'package:jsonjson/Models/County.dart';
import 'package:http/http.dart' as http;
class Api {
  static const baseUrl = "http://192.168.1.47:14587/api/";


  Future<List<County>?> getCounties() async {
    return http
        .get(
      Uri.parse(baseUrl + 'county'),
    )
        .then((data) {
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        List<County> a = [];
        Iterable list = json.decode(data.body);

        a = list.map((model) => County.fromJson(model)).toList();

        return a;
      }
      return null;
    });
  }
  Future<County?> getCounty(int id) async {
    return http
        .get(
      Uri.parse(baseUrl + 'county/' + id.toString()),
    )
        .then((data) {
      print(json.decode(data.body));
      if (data.statusCode == 200) {
        County county = County.fromJson(json.decode(data.body));


        return county;
      }
      return null;
    });
  }
}
