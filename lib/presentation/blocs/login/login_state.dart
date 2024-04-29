part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class StartLoginProcessLoadingState extends LoginState {}

final class StartLoginProcessSuccessState extends LoginState {}

final class StartLoginProcessFailState extends LoginState {}
