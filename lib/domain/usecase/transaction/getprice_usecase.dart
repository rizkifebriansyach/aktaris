import 'package:aktaris_app/core/error/failure.dart';
import 'package:aktaris_app/core/usecase/param_usecase.dart';
import 'package:aktaris_app/domain/repository/transaction_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPriceUsecase extends ParamUseCase< Map<String, dynamic>, GetPriceParams> {
  final TransactionRepository repository;
  GetPriceUsecase({required this.repository});

  @override
  Future<Either<Failure,  Map<String, dynamic>>> execute(GetPriceParams params) async{
    return await repository.getPrice(productName: params.productName, packageid: params.packageid);
  }
}

class GetPriceParams extends Equatable {
  final String? packageid;
  final String productName;

  const GetPriceParams({this.packageid, required this.productName});

  @override
  List<Object?> get props => [packageid,productName];
}
