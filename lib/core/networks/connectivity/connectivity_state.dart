part of 'connectivity_bloc.dart';

abstract class ConnectivityState {
  const ConnectivityState();
}

class ConnectivityInitialState extends ConnectivityState {
  const ConnectivityInitialState();
}

class ConnectivityLoadingState extends ConnectivityState {
  const ConnectivityLoadingState();
}

class ConnectedState extends ConnectivityState {
  final String message;
  const ConnectedState({required this.message});
}

class NoConnectedState extends ConnectivityState {
  final String message;
  const NoConnectedState({required this.message});
}