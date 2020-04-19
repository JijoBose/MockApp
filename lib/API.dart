import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  // List all Users
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

  // Get User Detail users/1
  static Future getUserDetail(int id) {
    var url = baseUrl + "/users/$id";
    return http.get(url);
  }

  // Get All Albums
  static Future getAlbums() {
    var url = baseUrl + "/albums";
    return http.get(url);
  }

  static Future getToDos() {
    var url = baseUrl + "/todos";
    return http.get(url);
  }
}
