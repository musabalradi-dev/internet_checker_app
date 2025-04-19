import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_event.dart';

part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  late final StreamSubscription<List<ConnectivityResult>> _subscription;
  final Connectivity _connectivity;

  ConnectivityBloc({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity(),
      super(ConnectivityInitialState()) {
    on<ConnectedEvent>(_onConnected);
    on<NoConnectedEvent>(_onDisconnected);

    _initConnectivityListener();
  }

  Future<void> _initConnectivityListener() async {
    // Emit initial state
    final initialResult = await _connectivity.checkConnectivity();
    _handleConnectivityResult(initialResult);

    // Listen for changes
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      _handleConnectivityResult(results);
    });
  }

  void _handleConnectivityResult(List<ConnectivityResult> results) {
    // Handle multiple connection types (some devices can have both WiFi and mobile)
    final isConnected = results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile,
    );

    if (isConnected) {
      add(ConnectedEvent());
    } else {
      add(NoConnectedEvent());
    }
  }

  void _onConnected(ConnectedEvent event, Emitter<ConnectivityState> emit) {
    emit(ConnectedState(message: 'Connected to Internet'));
  }

  void _onDisconnected(
    NoConnectedEvent event,
    Emitter<ConnectivityState> emit,
  ) {
    emit(NoConnectedState(message: 'No Internet Connection'));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
