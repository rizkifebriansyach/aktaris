import 'package:aktaris_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure,Type>> execute();
}