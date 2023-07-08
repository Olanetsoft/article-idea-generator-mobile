import 'package:article_idea_generator/features/shared/data/data_sources/share_data_source.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/text_data_exchange_repository.dart';

class TextDataExchangeRepositoryImpl implements TextDataExchangeRepository {
  TextDataExchangeRepositoryImpl({
    required ShareDataSource shareDataSource,
  }) : _shareDataSource = shareDataSource;

  final ShareDataSource _shareDataSource;

  @override
  Future<void> shareText(String text) async {
    await _shareDataSource.share(text);
  }
}
