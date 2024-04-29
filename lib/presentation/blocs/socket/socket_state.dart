part of 'socket_bloc.dart';

@immutable
sealed class SocketState {}

final class SocketInitial extends SocketState {}
final class SocketAddNew extends SocketState {}
