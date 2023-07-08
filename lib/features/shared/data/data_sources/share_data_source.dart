import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

abstract class ShareDataSource {
  Future<void> share(
    String text, {
    String? subject,
  });
}

class SharePlusDataSource implements ShareDataSource {
  final SharePlus _sharePlus;

  SharePlusDataSource({
    required SharePlus sharePlus,
  }) : _sharePlus = sharePlus;

  @override
  Future<void> share(
    String text, {
    String? subject,
  }) async {
    await _sharePlus.share(
      text,
      subject: subject,
    );
  }
}

class SharePlus {
  Future<void> share(
    String text, {
    Rect? sharePositionOrigin,
    String? subject,
  }) async {
    await Share.share(
      text,
      sharePositionOrigin: sharePositionOrigin,
      subject: subject,
    );
  }

  Future<void> shareFiles(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) async {
    Share.share(
      text,
      sharePositionOrigin: sharePositionOrigin,
      subject: subject,
    );
  }
}

final shareDataSourceProvider = Provider<ShareDataSource>(
  (ref) => SharePlusDataSource(sharePlus: SharePlus()),
);
