import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

  static Future getAlbums() {
    var url = baseUrl + "/albums";
    return http.get(url);
  }

  static Future getToDos() {
    var url = baseUrl + "/todos";
    return http.get(url);
  }
}
