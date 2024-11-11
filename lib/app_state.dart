import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userType = '';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  String _page = '';
  String get page => _page;
  set page(String value) {
    _page = value;
  }

  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  set latlong(LatLng? value) {
    _latlong = value;
  }

  bool _searchIsActive = false;
  bool get searchIsActive => _searchIsActive;
  set searchIsActive(bool value) {
    _searchIsActive = value;
  }
}
