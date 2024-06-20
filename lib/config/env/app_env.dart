import 'package:aktaris_app/config/env/app_config.dart';
import 'package:aktaris_app/config/env/config_data.dart';

enum Environment {
  PRODUCTION,
  STAGING,
  DEVELOPMENT,
}

class AppEnv {
  static Config config = Config(
    authBaseUrl: AppConfiguration.devBaseUrl,
    tokenType: AppConfiguration.tokenType,
    clientToken: AppConfiguration.devClientToken,
  );
  static Environment env = Environment.DEVELOPMENT;

  static set(Environment environment) {
    env = environment;
    switch (environment) {
      case Environment.PRODUCTION:
        config = Config(
          authBaseUrl: AppConfiguration.prodBaseUrl,
          tokenType: AppConfiguration.tokenType,
          clientToken: AppConfiguration.prodClientToken,
         
        );
        break;
      case Environment.STAGING:
        config = Config(
          authBaseUrl: AppConfiguration.stagingBaseUrl,
          tokenType: AppConfiguration.tokenType,
          clientToken: AppConfiguration.stagingClientToken,
         
        );
        break;
      case Environment.DEVELOPMENT:
        config = Config(
          authBaseUrl: AppConfiguration.authBaseUrl,
          rocketBaseUrl: AppConfiguration.rocketBaseUrl,
          tokenType: AppConfiguration.tokenType,
          clientToken: AppConfiguration.devClientToken,
        );
        break;
    }
  }
}
