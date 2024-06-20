import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotarisRepository {
  Future<Either<Failure, List<NotarisListEntity>>> getNotarisList();
}
