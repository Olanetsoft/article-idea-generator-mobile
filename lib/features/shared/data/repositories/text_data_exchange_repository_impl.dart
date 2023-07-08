import 'package:article_idea_generator/features/shared/data/data_sources/clipboard_data_source.dart';
import 'package:article_idea_generator/features/shared/data/data_sources/share_data_source.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/text_data_exchange_repository.dart';

class TextDataExchangeRepositoryImpl implements TextDataExchangeRepository {
  TextDataExchangeRepositoryImpl({
    required ShareDataSource shareDataSource,
    required ClipboardDataSource clipboardDataSource,
  })  : _shareDataSource = shareDataSource,
        _clipboardDataSource = clipboardDataSource;

  final ShareDataSource _shareDataSource;
  final ClipboardDataSource _clipboardDataSource;

  @override
  Future<void> shareText(String text) async {
    await _shareDataSource.share(text);
  }

  @override
  Future<void> copyText(String text) async {
    await _clipboardDataSource.copy(text);
  }
}
