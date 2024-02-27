import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _assistantId = prefs.getString('ff_assistantId') ?? _assistantId;
    });
    _safeInit(() {
      _assistantId2 = prefs.getString('ff_assistantId2') ?? _assistantId2;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _apikey = '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';
  String get apikey => _apikey;
  set apikey(String value) {
    _apikey = value;
  }

  String _assistantId = 'asst_akVyPXH1EoUPAoIoiMtRS0Pw';
  String get assistantId => _assistantId;
  set assistantId(String value) {
    _assistantId = value;
    prefs.setString('ff_assistantId', value);
  }

  String _respuestaTestUser = '';
  String get respuestaTestUser => _respuestaTestUser;
  set respuestaTestUser(String value) {
    _respuestaTestUser = value;
  }

  int _contVis = 0;
  int get contVis => _contVis;
  set contVis(int value) {
    _contVis = value;
  }

  int _contLect = 0;
  int get contLect => _contLect;
  set contLect(int value) {
    _contLect = value;
  }

  int _contKine = 0;
  int get contKine => _contKine;
  set contKine(int value) {
    _contKine = value;
  }

  int _contAudi = 0;
  int get contAudi => _contAudi;
  set contAudi(int value) {
    _contAudi = value;
  }

  int _contTEST = 1;
  int get contTEST => _contTEST;
  set contTEST(int value) {
    _contTEST = value;
  }

  String _respusaud1 = '';
  String get respusaud1 => _respusaud1;
  set respusaud1(String value) {
    _respusaud1 = value;
  }

  String _userimg = '';
  String get userimg => _userimg;
  set userimg(String value) {
    _userimg = value;
  }

  String _respuestaUser = '';
  String get respuestaUser => _respuestaUser;
  set respuestaUser(String value) {
    _respuestaUser = value;
  }

  String _assistantId2 = 'asst_jFfn3oX1ZvYvUkFDORH3PNRS';
  String get assistantId2 => _assistantId2;
  set assistantId2(String value) {
    _assistantId2 = value;
    prefs.setString('ff_assistantId2', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
