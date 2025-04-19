part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent {
  const ConnectivityEvent();
}

class ConnectedEvent extends ConnectivityEvent {
  const ConnectedEvent();
}

class NoConnectedEvent extends ConnectivityEvent {
  const NoConnectedEvent();
}