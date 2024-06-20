import 'package:aktaris_app/data/model/transaction/transaction_history.dart';
import 'package:equatable/equatable.dart';

class TransactionHistoryEntity extends Equatable {
  String? transactionId;
  int? notarisId;
  String? name;
  String? productName;
  String? paymentStatus;
  String? paymentType;
  int? subTotalFee;
  int? biayaLayanan;
  DateTime? createAt;
  DateTime? updateAt;

  @override
  List<Object?> get props => [
        transactionId,
        notarisId,
        name,
        productName,
        paymentStatus,
        paymentType,
        subTotalFee,
        biayaLayanan,
        createAt,
        updateAt
      ];
}
