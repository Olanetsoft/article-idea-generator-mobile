import 'package:equatable/equatable.dart';

class ArticleIdea extends Equatable {
  const ArticleIdea({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  @override
  List<Object?> get props => [id, title];
}
