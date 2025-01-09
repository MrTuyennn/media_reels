/// Class for Environment variables.
final class Environment {
  static const restApiUrl = String.fromEnvironment(
      'https://ouk4ac913a.execute-api.ap-northeast-2.amazonaws.com/v1/');
  static const restApiKey = String.fromEnvironment('REST_API_KEY');
  static const chatAuthKey = String.fromEnvironment('CHAT_AUTH_KEY');
}
