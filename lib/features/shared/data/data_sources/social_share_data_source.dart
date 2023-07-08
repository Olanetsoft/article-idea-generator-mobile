import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_share/social_share.dart';

abstract class SocialShareDataSource {
  Future<String?> shareTwitter(
    String captionText, {
    List<String>? hashtags,
    String? url,
  });
}

class FlutterSocialShareDataSource implements SocialShareDataSource {
  final FlutterSocialShare _socialShare;

  FlutterSocialShareDataSource({
    required FlutterSocialShare socialShare,
  }) : _socialShare = socialShare;

  @override
  Future<String?> shareTwitter(
    String captionText, {
    List<String>? hashtags,
    String? url,
  }) {
    return _socialShare.shareTwitter(
      captionText,
      hashtags: hashtags,
      url: url,
    );
  }
}

class FlutterSocialShare {
  Future<String?> shareTwitter(
    String captionText, {
    List<String>? hashtags,
    String? url,
    String? trailingText,
  }) async {
    await SocialShare.shareTwitter(
      captionText,
      hashtags: hashtags,
      trailingText: trailingText,
      url: url,
    );
    return null;
  }
}

final socialShareDataSourceProvider = Provider<SocialShareDataSource>(
  (ref) => FlutterSocialShareDataSource(socialShare: FlutterSocialShare()),
);
