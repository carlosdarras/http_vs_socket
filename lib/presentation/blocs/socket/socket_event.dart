part of 'socket_bloc.dart';

@immutable
sealed class SocketEvent {}

class SendEventSocket extends SocketEvent{}
