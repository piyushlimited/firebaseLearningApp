import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../data/constants/app_constants.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  Future<bool> checkConnectionStatus() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult.first != ConnectivityResult.none;
  }

  void startMonitoring() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.first == ConnectivityResult.none) {
        internetConnected.value = false;
      } else {
        internetConnected.value = true;
      }
    });
  }

  void dispose() {
    connectivitySubscription.cancel();
  }
}
