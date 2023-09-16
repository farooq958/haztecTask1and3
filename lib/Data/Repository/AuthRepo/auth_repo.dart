import 'package:flutter/foundation.dart';
import 'package:taskhaztec/Application/Services/ApiServices/api_services.dart';
import 'package:taskhaztec/Data/DataSource/Resources/api_constants.dart';

class AuthRepo{


  Future<Map<String,dynamic>> login(body) async {
    try {

      return await Api.post(ApiConstants.loginUrl, body,
          )
          .then((value) {
        if (kDebugMode) {
          print("P Response ${value}");
        }

        return value;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

}