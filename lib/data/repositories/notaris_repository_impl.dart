import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/data/datasource/notaris/notaris_list%20local_datasource.dart';
import 'package:aktaris_app/data/datasource/notaris/notaris_list_remote_datasource.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:aktaris_app/domain/repository/notaris_list_repository.dart';
import 'package:dartz/dartz.dart';

class NotarisRepositoryImpl implements NotarisRepository {
  final NotarisListRemoteDatasource notarisListRemoteDatasource;
  final NotarisListLocalDatasource notarisListLocalDatasource;

  NotarisRepositoryImpl(
      {required this.notarisListRemoteDatasource,
      required this.notarisListLocalDatasource});

      
  @override
  Future<Either<Failure, List<NotarisListEntity>>> getNotarisList() async {
    try {
      final result = await notarisListLocalDatasource.getNotarisList();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
