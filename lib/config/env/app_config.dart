import 'package:aktaris_app/config/app/app_info.dart';

import '../network/api_token_manager.dart';

class AppConfiguration {
  //-- Main Configuration
  static const tokenType = TokenType.REFRESH_TOKEN;

  //-- Base URL Microservices
  static const authBaseUrl = '';
  static const rocketBaseUrl = '';

  //-- Production
  static const prodBaseUrl = 'https://api.github.production.com';
  static const prodClientToken = 'Some Client Token';

  //-- Staging
  static const stagingBaseUrl = 'https://api.github.staging.com';
  static const stagingClientToken = 'Some Client Token';

  //-- Development
  static const devBaseUrl = 'https://api.github.com';
  static const devClientToken = 'Some Client Token';

  //-- App Info
  static String appName = 'DiMeterai';
  static String appTag = 'Flutter Getx';
  static String appVersion = AppInfo.packageInfo.version;
  static String buildNumber = AppInfo.packageInfo.buildNumber;
  static String packageName = AppInfo.packageInfo.packageName;
}
