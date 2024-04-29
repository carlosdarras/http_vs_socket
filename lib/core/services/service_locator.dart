import 'package:get_it/get_it.dart';
import 'package:http_buttery_life_poc/data/datasource/auth_datasource.dart';
import 'package:http_buttery_life_poc/data/repositories/auth_repository.dart';
import 'package:http_buttery_life_poc/domain/repository/auth_repo.dart';
import 'package:http_buttery_life_poc/domain/usecase/login_usecase.dart';

GetIt sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    sl
      ..registerLazySingleton(() => LoginUsecase(sl()))
      ..registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()))
      ..registerLazySingleton<BaseAuthDatasource>(() => AuthDatasource());
  }
}
