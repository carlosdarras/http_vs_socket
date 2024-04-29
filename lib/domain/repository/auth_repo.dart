import 'package:dartz/dartz.dart';
import 'package:http_buttery_life_poc/core/error/failure.dart';

abstract class BaseAuthRepository{
  Future<Either<Failure,String>> login(String email ,String password);
}