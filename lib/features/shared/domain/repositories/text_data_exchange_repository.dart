import 'package:article_idea_generator/features/shared/data/data_sources/share_data_source.dart';
import 'package:article_idea_generator/features/shared/data/repositories/text_data_exchange_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TextDataExchangeRepository {
  Future<void> shareText(String text);
}

final textDataExchangeRepositoryProvider = Provider<TextDataExchangeRepository>(
  (ref) => TextDataExchangeRepositoryImpl(
    shareDataSource: ref.read(shareDataSourceProvider),
  ),
);
