import 'package:dartz/dartz.dart';
import 'package:http_buttery_life_poc/core/error/failure.dart';
import 'package:http_buttery_life_poc/domain/repository/auth_repo.dart';

class LoginUsecase {
  final BaseAuthRepository baseAuthRepository;

  LoginUsecase(this.baseAuthRepository);

  Future<Either<Failure,String>>call (String email, String password)async{
    return await baseAuthRepository.login(email, password);
  }
}