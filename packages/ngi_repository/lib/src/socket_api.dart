// ignore_for_file: public_member_api_docs, library_prefixes, lines_longer_than_80_chars, cascade_invocations, avoid_print, avoid_dynamic_calls, avoid_void_async, unused_catch_stack
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:ngi_repository/ngi_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class StreamSocketController<T> {
  StreamSocketController() {
    print('Init Stream controller ${T.toString()}');
  }
  final _socketResponse = StreamController<T>();
  void Function(T) get addResponse => _socketResponse.sink.add;
  Stream<T> get getResponse => _socketResponse.stream;
  void dispose() {
    _socketResponse.close();
  }
}

enum SocketConnectionStatus {
  unknown,
  disconnected,
  connected,
  connecting,
  error,
  closed,
  reconnecting,
  Unauthorized
}

class SocketApi {
  static final _socketStatusController =
      StreamController<SocketConnectionStatus>();
  // Factry constructor to retutn same static instance everytime you create any object.
  factory SocketApi() {
    return _socketApi;
  }
  // An internal private constructor to access it for only once for static instance of class.
  SocketApi._internal() {
    print('internal');
  }
  static Future<void> init() async {
    token = await Hive.box<dynamic>('login').get('token') as String?;
    final userData = await AuthenticationRepository().getUserData();
    print('socket init: ${socket.connected ? 'connected' : 'disconnected'}');
    if (socket.disconnected) {
      _socketStatusController.add(SocketConnectionStatus.disconnected);
      socket.onConnecting((dynamic _) {
        print('socket connecting');
        _socketStatusController.add(SocketConnectionStatus.connecting);
      });
      socket.onConnectTimeout((dynamic _) => print('socket connect timeout'));
      socket.onConnectError(
          (dynamic error) => print('socket connect error $error'));
      // connected
      socket.on('server:connected', (dynamic data) {
        socket.emit(
          'user:connected',
          {'user': userData},
        );
        print('socket instance created and user:connected');
        _socketStatusController.add(SocketConnectionStatus.connected);
      });
      //error
      socket.onError(
        (dynamic error) {
          print('socket error $error');
          if (error.toString() == 'Not authorized') {
            _socketStatusController.add(SocketConnectionStatus.Unauthorized);
          }
        },
      );
      //reconnect
      socket.onReconnecting((dynamic number) {
        print('socket reconnect attempt number ${number.toString()}');
        _socketStatusController.add(SocketConnectionStatus.reconnecting);
      });
      socket.onReconnect((dynamic number) {
        print('socket reconnected after ${number.toString()} attempt(s)');
        _socketStatusController.add(SocketConnectionStatus.connected);
      });
      socket.onReconnectFailed((dynamic _) {
        print(
            'socket reconnect failed, couldnt reconnect within the reconnection Attempts llimit');
        _socketStatusController.add(SocketConnectionStatus.disconnected);
      });
      socket.onReconnectError((dynamic error) {
        print('socket reconnect error: ${error.toString()}');
        //_socketStatusController.add(SocketConnectionStatus.reconnecting);
      });
      // disconnect
      socket.onDisconnect((dynamic _) {
        print('socket instance disconnected');
        _socketStatusController.add(SocketConnectionStatus.disconnected);
      });
      socket.connect();
    } else if (socket.connected) {
      print('socket instance already connected');
      _socketStatusController.add(SocketConnectionStatus.connected);
    } else {
      print('socket unknown state');
      _socketStatusController.add(SocketConnectionStatus.unknown);
    }
  }

  static Future<void> dispose() async {
    await Future<dynamic>.delayed(Duration(seconds: 1));
    socket.dispose();
    _socketStatusController.add(SocketConnectionStatus.disconnected);
  }

  // A static private instance to access _socketApi from inside class only
  static final SocketApi _socketApi = SocketApi._internal();
  static IO.Socket socket = IO.io(
    ActiveEnvironments.socketURL,
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .enableForceNewConnection()
        .setTimeout(500000)
        .setReconnectionDelay(500)
        .enableReconnection()
        .setQuery(
          <dynamic, dynamic>{'token': token},
        )
        .build(),
  );
  static String? token = '';
  static Stream<SocketConnectionStatus> get socketStatus async* {
    yield* _socketStatusController.stream;
  }

  //  asset stream
  static Stream<Asset> getAsset() async* {
    final streamSocket = StreamSocketController<Asset>();
    try {
      socket.on('newMsg', (dynamic data) {
        //print('newMsg');
        try {
          streamSocket
              .addResponse(Asset.fromJson(data as Map<String, dynamic>));
          // print(data['name']);
        } catch (e, stackTrace) {
          print('Exception newMsg');
          print(e);
          print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse;
    } catch (e) {
      print('Exception getAsset');
      print(e);
    } finally {
      print('Stream controller asset closed');
      socket.off('newMsg');
      streamSocket.dispose();
    }
  }

  // alert stream
  static Stream<Alert> getAlert() async* {
    final streamSocket = StreamSocketController<Alert>();
    try {
      socket.on('newAlert', (dynamic data) {
        //print('newAlert');
        try {
          streamSocket
              .addResponse(Alert.fromJson(data as Map<String, dynamic>));
          // print(data['name']);
        } catch (e, stackTrace) {
          print('Exception newAlert');
          print(e);
          print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse;
    } catch (e) {
      print('Exception getAlert');
      print(e);
    } finally {
      print('Stream controller alert closed');
      socket.off('newAlert');
      streamSocket.dispose();
    }
  }

  static Stream<Alert> getAlertNew() async* {
    final streamSocket = StreamSocketController<Alert>();
    try {
      socket.on('newAlert', (dynamic data) {
        try {
          streamSocket
              .addResponse(Alert.fromJson(data as Map<String, dynamic>));
        } catch (e, stackTrace) {
          print('Exception newAlert');
          print(e);
          // print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse.take(20);
    } catch (e) {
      print('Exception getAlertNew');
      print(e);
    } finally {
      print('Stream controller alert new closed');
      socket.off('newAlert');
      streamSocket.dispose();
    }
  }

  static Stream<Alert> getAlertUpdate() async* {
    final streamSocket = StreamSocketController<Alert>();
    try {
      socket.on('updateAlert', (dynamic data) {
        try {
          streamSocket
              .addResponse(Alert.fromJson(data as Map<String, dynamic>));
        } catch (e, stackTrace) {
          print('Exception updateAlert');
          print(e);
          // print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse.take(20);
    } catch (e) {
      print('Exception getAlertUpdate');
      print(e);
    } finally {
      print('Stream controller alert update closed');
      socket.off('updateAlert');
      streamSocket.dispose();
    }
  }

  static Stream<Driver> getDriverChange() async* {
    final streamSocket = StreamSocketController<Driver>();
    try {
      socket.on('changeDriver', (dynamic data) {
        try {
          streamSocket
              .addResponse(Driver.fromJson(data as Map<String, dynamic>));
        } catch (e, stackTrace) {
          print('Exception changeDriver');
          print(e);
          // print(stackTrace);
          print(data);
        }
      });
      yield* streamSocket.getResponse.take(2);
    } catch (e) {
      print('Exception getDriverChange');
      print(e);
    } finally {
      print('Stream controller driver closed');
      socket.off('changeDriver');
      streamSocket.dispose();
    }
  }
}

//main
void main() async {
  await SocketApi.init();
  SocketApi.getAsset().listen(
    (Asset data) {
      print('Asset.1: ${data.name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** asset.1 stream controller Done ***');
    },
  );
  SocketApi.getAlertNew().listen(
    (Alert data) {
      print('Alert-New.1: ${data.name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** alert-new.1 stream controller Done ***');
    },
  );
  SocketApi.getAlertUpdate().listen(
    (Alert data) {
      print('Alert-Update.1: ${data.name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** alert-update.1  stream controller Done ***');
    },
  );
  SocketApi.getDriverChange().listen(
    (Driver data) {
      print('Drievr-Change.1: ${data.first_name} ${data.last_name}');
    },
    cancelOnError: false,
    onError: print,
    onDone: () {
      print('*** driver-change.1 stream controller Done ***');
    },
  );
}
