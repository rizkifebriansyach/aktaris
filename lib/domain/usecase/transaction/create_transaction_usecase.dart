import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/transaction_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateTransactionUsecase extends ParamUseCase<Map<String, dynamic>, CreateTransactionParams> {
  final TransactionRepository repository;
  CreateTransactionUsecase({required this.repository});

  @override
  Future<Either<Failure,  Map<String, dynamic>>> execute(CreateTransactionParams params) async{
    return await repository.createTransaction(productName: params.productName, packageid: params.packageid);
  }
}

class CreateTransactionParams extends Equatable {
  final String? packageid;
  final String productName;

  const CreateTransactionParams({this.packageid, required this.productName});

  @override
  List<Object?> get props => [packageid,productName];
}
