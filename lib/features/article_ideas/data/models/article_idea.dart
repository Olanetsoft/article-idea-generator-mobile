import 'package:equatable/equatable.dart';

class ArticleIdea extends Equatable {
  const ArticleIdea({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [title];
}
