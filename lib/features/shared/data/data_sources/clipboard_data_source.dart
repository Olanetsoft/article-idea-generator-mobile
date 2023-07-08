import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ClipboardDataSource {
  Future<void> copy(String text);
}

class FlutterClipboardDataSource implements ClipboardDataSource {
  final FlutterClipboard _flutterClipboard;

  FlutterClipboardDataSource({
    required FlutterClipboard flutterClipboard,
  }) : _flutterClipboard = flutterClipboard;

  @override
  Future<void> copy(String text) async {
    await _flutterClipboard.setText(text);
  }
}

class FlutterClipboard {
  Future<void> setText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}

final clipBoardDataSourceProvider = Provider<ClipboardDataSource>(
  (ref) => FlutterClipboardDataSource(flutterClipboard: FlutterClipboard()),
);
