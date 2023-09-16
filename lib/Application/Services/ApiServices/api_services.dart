import 'dart:convert';
import 'dart:io';

//import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:taskhaztec/Data/DataSource/Resources/imports.dart';

class Api {
  static Map<String, String> _authMiddleWare() {
    String? us = SharedPrefs.getUserToken();
    print(us);

   return {
      'Content-Type': 'application/json'
    };
  }

  static Future<dynamic> get(String url,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.get(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200) {
      var  decode = jsonDecode(res.body);
        return decode;
      }
      return {"success": false, "error": res.body, "body": null};
    }
    on SocketException catch (e) {
      // Handle SocketException here.
      return {
        "success": false,
        "error": 'No Internet Please Connect To Internet',
        //"body": res.body
      };
      print('SocketException: $e');
      // You can display an error message to the user or perform other actions.
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {
        "success": false,
        "error": e.message,
        //"body": res.body
      };
    }

    catch (e) {
    return Future.error(e);
    }
  }



  static Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body,
      {Map<String, String>? header}) async {
    try {
      // final headers = {'Content-Type': 'application/json'};

      http.Response res = await http.post(
        Uri.parse(url),
        headers: header ?? _authMiddleWare(),
        body: jsonEncode(body),
      );
      print("Response ${res.body}");
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": res.body,
        "body": res.body
      };
    }
    on SocketException catch (e) {
      // Handle SocketException here.
      return {
        "success": false,
        "error": 'No Internet Please Connect To Internet',
        //"body": res.body
      };
      print('SocketException: $e');
      // You can display an error message to the user or perform other actions.
    } on HttpException catch (e) {
      // Handle HttpException (e.g., invalid URL) here.
      return {
        "success": false,
        "error": e.message,
        //"body": res.body
      };
    }

    catch (e) {
      return Future.error(e);
    }
  }





  static Future post1(
      Map<String, dynamic> body, {
        required String url,
      }) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: _authMiddleWare(), body: jsonEncode(body));

      print("Response status ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return 200;
      } else {
        throw Exception('Failed to sign up user');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }


  static Future<Map<String, dynamic>> put(
      String url, Map<String, dynamic>? body,
      {Map<String, String>? headers}) async {
    try {
      //print(body);
      http.Response res = await http.put(
        Uri.parse(url),
        headers: headers ?? _authMiddleWare(),
        body: jsonEncode(body),
        //encoding: Encoding.getByName("application/x-www-form-urlencoded")
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }

      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }



  static Future<Map<String, dynamic>> delete(String url, String id,
      {Map<String, String>? headers}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse("$url/$id"),
        headers: headers ?? _authMiddleWare(),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> decode = jsonDecode(res.body);
        return decode;
      }
      return {
        "success": false,
        "error": "${res.statusCode} ${res.reasonPhrase}",
        "body": null
      };
    } catch (e) {
      return Future.error(e);
    }
  }
}
