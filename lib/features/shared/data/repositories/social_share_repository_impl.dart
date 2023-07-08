import 'package:article_idea_generator/features/shared/data/data_sources/social_share_data_source.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/social_share_repository.dart';

class SocialShareRepositoryImpl implements SocialShareRepository {
  SocialShareRepositoryImpl({
    required SocialShareDataSource socialShareDataSource,
  }) : _socialShareDataSource = socialShareDataSource;

  final SocialShareDataSource _socialShareDataSource;

  @override
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
