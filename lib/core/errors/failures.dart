import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({this.message});
  final Object? message;
}

class CacheFailure extends Failure {}
