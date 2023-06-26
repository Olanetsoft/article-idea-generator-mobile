import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException(this.message);

  final String message;

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message];
}
