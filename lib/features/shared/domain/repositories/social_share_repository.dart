import 'package:article_idea_generator/features/shared/data/data_sources/social_share_data_source.dart';
import 'package:article_idea_generator/features/shared/data/repositories/social_share_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SocialShareRepository {
  Future<String?> shareTwitter(
    String captionText, {
    List<String>? hashtags,
    String? url,
  });
}

final socialShareRepositoryProvider = Provider<SocialShareRepository>(
  (ref) => SocialShareRepositoryImpl(
    socialShareDataSource: ref.read(socialShareDataSourceProvider),
  ),
);
