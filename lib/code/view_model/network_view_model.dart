import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NetworkViewModel extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ValueNotifier<ConnectivityResult> connectivityResultStatus =
      ValueNotifier(ConnectivityResult.none);

  ConnectivityResult get connectivityResult => connectivityResultStatus.value;

  set connectivityResult(ConnectivityResult value) {
    connectivityResultStatus.value = value;
  }

  // Subscribe the connectivity
  initListener() {
    print('initListener');
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return _updateConnectionStatus(result!);
  }

  // Check Connectivity Status
  Future<ConnectivityResult> checkConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return result!;
  }

  disposeListener() {
    _connectivitySubscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    print('_updateConnectionStatus');
    switch (result) {
      case ConnectivityResult.wifi:
        print('WIFI');
        connectivityResult = ConnectivityResult.wifi;
        /*setState(() {
          _connectionStatus = '$result\n'
              'Wifi Name: $wifiName\n'
              'Wifi BSSID: $wifiBSSID\n'
              'Wifi IP: $wifiIP\n';
        });*/
        break;
      case ConnectivityResult.mobile:
        print('Mobile');
        connectivityResult = ConnectivityResult.mobile;
        break;
      case ConnectivityResult.none:
        print('None');
        connectivityResult = ConnectivityResult.none;
        //setState(() => _connectionStatus = result.toString());
        break;
      default:
        print('None');
        connectivityResult = ConnectivityResult.none;
        //setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}
