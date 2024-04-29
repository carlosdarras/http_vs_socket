import 'package:dio/dio.dart';
import 'package:http_buttery_life_poc/core/network/apis.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiUrl.baseApiUrl,
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required data,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "lang": lang ?? "en",
      "Authorization": "Bearer $token",
      "accept": "application/json",
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
