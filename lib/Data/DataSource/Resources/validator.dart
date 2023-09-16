



import 'package:easy_localization/easy_localization.dart';

class Validate {
  static String? email(v) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern.toString());
    if (v.trim().isEmpty) {
      return "Please provide email";
    } else if (!regExp.hasMatch(v)) {
      return 'Email Not Valid';
    }
    return null;
  }

  static bool? userNameCheck(v) {
    // Pattern pattern =
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    // RegExp regExp = RegExp(pattern.toString());
    if (v.trim().isEmpty) {
      return null;
    } else if (v.toString().length>4) {
      return true;
    }
    else {
      return false;
    }
  }

  static String? password(v) {
    if (v.trim().isEmpty) {
      return "Please provide password".tr();
    }
    if (v.length < 6) {
      return "Must be greater than 6".tr();
    }
    return null;
  }
  static String? userName(v) {
    if (v.trim().isEmpty) {
      return "Please provide userName".tr();
    }
    if (v.length < 4) {
      return "Must be greater than 4".tr();
    }
    return null;
  }



  // for validating country
  static String? validateCountry(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Country name';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Country name should not contain numeric characters';
    } else if (RegExp(r'^\d{1,10}\s').hasMatch(value)) {
      return 'Country name should not contain numbers at the beginning';
    } else if (RegExp(r'\d{1,10}$').hasMatch(value)) {
      return 'Country name should not contain numbers at the end';
    }
    return null;
  }

  // for validating city
  static String? validateCity(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter City name';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'City name should not contain numeric characters';
    } else if (RegExp(r'^\d{1,10}\s').hasMatch(value)) {
      return 'City name should not contain numbers at the beginning';
    } else if (RegExp(r'\d{1,10}$').hasMatch(value)) {
      return 'City name should not contain numbers at the end';
    }
    return null;
  }


}
