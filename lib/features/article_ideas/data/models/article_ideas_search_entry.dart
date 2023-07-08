import 'package:equatable/equatable.dart';

class ArticleIdeasSearchEntry extends Equatable {
  const ArticleIdeasSearchEntry({
    required this.text,
  });

  final String text;

  @override
  List<Object?> get props => [text];
}
