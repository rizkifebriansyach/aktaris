import 'package:aktaris_app/domain/entities/transaction/transaction_history_entity.dart';

class TransactionHistory extends TransactionHistoryEntity {
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

  TransactionHistory({
    this.transactionId,
    this.notarisId,
    this.name,
    this.productName,
    this.paymentStatus,
    this.paymentType,
    this.subTotalFee,
    this.biayaLayanan,
    this.createAt,
    this.updateAt,
  });

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      TransactionHistory(
        transactionId: json["transaction_id"],
        notarisId: json["notaris_id"],
        name: json["name"],
        productName: json["product_name"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        subTotalFee: json["sub_total_fee"],
        biayaLayanan: json["biaya_layanan"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "notaris_id": notarisId,
        "name": name,
        "product_name": productName,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "sub_total_fee": subTotalFee,
        "biaya_layanan": biayaLayanan,
        "create_at": createAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
      };
}
