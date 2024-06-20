import 'package:aktaris_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ParamUseCase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

abstract class StreamParamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> execute(Params params);
}