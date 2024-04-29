import 'package:dartz/dartz.dart';
import 'package:http_buttery_life_poc/core/error/exceptions.dart';
import 'package:http_buttery_life_poc/core/error/failure.dart';
import 'package:http_buttery_life_poc/data/datasource/auth_datasource.dart';
import 'package:http_buttery_life_poc/domain/repository/auth_repo.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthDatasource baseAuthDatasource;

  AuthRepository(this.baseAuthDatasource);

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final result = await baseAuthDatasource.login(email, password);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
