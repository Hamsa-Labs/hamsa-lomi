import 'package:dartz/dartz.dart';

import '../failure.dart';

/// A base class with generic params [T] the return
/// type of the right side of the [Either] and [P] the
/// param that will be given to the function call.
abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P param);
}
