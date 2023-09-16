import 'dart:developer';

import 'package:taskhaztec/Application/Services/ApiServices/api_services.dart';
import 'package:taskhaztec/Data/DataSource/Resources/api_constants.dart';

class ProductRepo{

  Future getAllProducts() async {
    try {
      return await Api.get(ApiConstants.productAllUrl).then((productApiValue) {
        log('message : $productApiValue');
        return productApiValue;
      }).catchError((e) {
        throw e;
      });
    } catch (e) {
      rethrow;
    }
  }

}