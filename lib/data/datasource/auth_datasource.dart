import 'package:dio/dio.dart';
import 'package:http_buttery_life_poc/core/error/exceptions.dart';
import 'package:http_buttery_life_poc/core/network/apis.dart';
import 'package:http_buttery_life_poc/core/network/error_message_model.dart';
import 'package:http_buttery_life_poc/core/services/dio_helper.dart';

abstract class BaseAuthDatasource {
  Future<String> login(String email, String password);
}

class AuthDatasource extends BaseAuthDatasource {
  @override
  Future<String> login(String email, String password) async {
    try {
      final res = await DioHelper.postData(url: MyApisUrls.login(), data: {
        "email": "m.jarwan@acacusgroup.com",
        "password": "abcd@1234",
      });
      return "Success";
    } on DioException catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }
}
