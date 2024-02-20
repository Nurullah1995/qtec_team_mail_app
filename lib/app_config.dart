import 'package:flutter/material.dart';

class AppConfig {
  static String app_name = "Qtec team email"; //this shows in the splash screen
  static String purchase_code = ""; //enter your purchase code for the app from codecanyon

  //Default language config
  static String default_language = "en";
  static String mobile_app_code = "en";
  static bool app_language_rtl = false;

  //configure this
  // static const bool HTTPS = false;
  static const bool HTTPS = true;


  // static const DOMAIN_PATH = "192.168.6.1/ecommerce"; //localhost
  static const DOMAIN_PATH = "api.mail.tm";

  //do not configure these below
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}";


  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
