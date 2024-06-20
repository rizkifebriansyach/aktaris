import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/no_param_usecase.dart';
import 'package:aktaris_app/domain/entities/notaris_list_entity.dart';
import 'package:aktaris_app/domain/repository/notaris_list_repository.dart';
import 'package:dartz/dartz.dart';

class NotarisListUsecase
    extends NoParamUseCase<List<NotarisListEntity>> {
  final NotarisRepository repository;
  NotarisListUsecase({required this.repository});

  @override
  Future<Either<Failure, List<NotarisListEntity>>> execute() async{
    return await repository.getNotarisList();
  }
}
