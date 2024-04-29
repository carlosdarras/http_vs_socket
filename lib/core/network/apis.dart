abstract class ApiUrl {
  static String baseApiUrl =
      "https://qa-lynxedgeapis-identity.azurewebsites.net/v1";
}

abstract class MyApisUrls {
  static String login() {
    return "${ApiUrl.baseApiUrl}/auth/Login";
  }
}
