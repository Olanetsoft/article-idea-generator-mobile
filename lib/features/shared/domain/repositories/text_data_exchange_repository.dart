import 'package:article_idea_generator/features/shared/data/data_sources/clipboard_data_source.dart';
import 'package:article_idea_generator/features/shared/data/data_sources/share_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextDataExchangeRepository {
  TextDataExchangeRepository({
    required ShareDataSource shareDataSource,
    required ClipboardDataSource clipboardDataSource,
  })  : _shareDataSource = shareDataSource,
        _clipboardDataSource = clipboardDataSource;

  final ShareDataSource _shareDataSource;
  final ClipboardDataSource _clipboardDataSource;

  Future<void> shareText(String text) async {
    await _shareDataSource.share(text);
  }

  Future<void> copyText(String text) async {
    await _clipboardDataSource.copy(text);
  }
}

final textDataExchangeRepositoryProvider = Provider<TextDataExchangeRepository>(
  (ref) => TextDataExchangeRepository(
    shareDataSource: ref.read(shareDataSourceProvider),
    clipboardDataSource: ref.read(clipBoardDataSourceProvider),
  ),
);
