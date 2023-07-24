import 'package:article_idea_generator/features/shared/data/data_sources/social_share_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialShareRepository {
  SocialShareRepository({
    required SocialShareDataSource socialShareDataSource,
  }) : _socialShareDataSource = socialShareDataSource;

  final SocialShareDataSource _socialShareDataSource;

  Future<String?> shareTwitter(
    String captionText, {
    List<String>? hashtags,
    String? url,
  }) {
    return _socialShareDataSource.shareTwitter(
      captionText,
      hashtags: hashtags,
      url: url,
    );
  }
}

final socialShareRepositoryProvider = Provider<SocialShareRepository>(
  (ref) => SocialShareRepository(
    socialShareDataSource: ref.read(socialShareDataSourceProvider),
  ),
);
