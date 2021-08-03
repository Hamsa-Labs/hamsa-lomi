// Package imports:
import 'package:equatable/equatable.dart';

class UseCaseParam<T> extends Equatable {
  final T param;

  UseCaseParam(this.param);

  @override
  List<Object?> get props => [param];
}
