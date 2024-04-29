import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'socket_event.dart';
part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(SocketInitial()) {
    channel = IOWebSocketChannel.connect(
        Uri.parse(
          'ws://lynxedgeuat-001-site1.htempurl.com/ws?lat=123&lng=456',
        ),
        headers: {"Authorization": 'Basic MTExNjY4NDM6NjAtZGF5ZnJlZXRyaWFs'});
    // channel.stream.listen(
    //       (message) {
    //     print('Received: $message');
    //   },
    //   onError: (error) {
    //     print('Error: $error');
    //   },
    //   onDone: () {
    //
    //     print('Connection closed');
    //   },
    // );
    channel.sink.add("dkdkdkdkddkd");
    on<SendEventSocket>(_onInitSocket);
  }

  late WebSocketChannel channel;
  late StreamSubscription socket;
  StreamController stream_controller = StreamController.broadcast();

  Stream _onInitSocket(
    SendEventSocket event,
    Emitter emit,
  ) async* {
    // channel.sink.close();



    // socket = channel.stream.listen((event) {
    //   print('the event we dkdkdkk ${event}');
    // });
    // channel.stream.listen((event) {
    //   print('the event we dkdkdkk ${event}');
    // });
    stream_controller.stream.listen(
          (data) {
        print('Received data: $data');
      },
      onError: (error) {
        print('Error occurred: $error');
      },
      onDone: () {
        print('Stream closed');
      },
    );
  }

  // @override
  // Future<void> close() {
  //   // channel.sink.close();
  //   // socket.cancel();
  //   // stream_controller.close();
  //   return super.close();
  // }
}
