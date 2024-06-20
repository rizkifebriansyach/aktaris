import '../network/api_token_manager.dart';

class Config {
  Config({
    required this.authBaseUrl,
    this.rocketBaseUrl,
    required this.clientToken,
    required this.tokenType,
  });

  String authBaseUrl;
  String? rocketBaseUrl;
  String clientToken;
  TokenType tokenType;
}
