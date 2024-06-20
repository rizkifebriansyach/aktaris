import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/config/network/api_response.dart';
import 'package:aktaris_app/data/model/transaction/transaction_history.dart';

abstract class TransactionRemoteDatasource {
  Future<Map<String, dynamic>> getPrice({
    String? packageid,
    required String productName,
  });
  Future<Map<String, dynamic>> createTransaction({
    String? packageid,
    required String productName,
  });
  Future<Map<String, dynamic>> payment({
    required String transactionId,
    required String paymentType,
  });
  Future<Map<String, dynamic>> checkStatusPayment({
    required String transactionId,
  });
  Future<Map<String, dynamic>> createTransactionRoomChat({
    required int userId,
    required String transactionId,
  });

  Future<List<TransactionHistory>> getListHistory();
}

class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  @override
  Future<Map<String, dynamic>> getPrice(
      {String? packageid, required String productName}) async {
    try {
      final response =
          await ApiRequest.post(url: "trans/get-price", useToken: true, body: {
        "list_order": [
          {
            "package_id": packageid,
            "ProductName": productName,
          }
        ],
      });
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createTransaction(
      {String? packageid, required String productName}) async {
    try {
      final response =
          await ApiRequest.post(url: "trans/new", useToken: true, body: {
        "list_order": [
          {
            "package_id": packageid,
            "ProductName": productName,
          }
        ],
      });
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> payment(
      {required String transactionId, required String paymentType}) async {
    try {
      final response =
          await ApiRequest.post(url: "trans/pay", useToken: true, body: {
        "transaction_id": transactionId,
        "payment_type": paymentType,
      });
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> checkStatusPayment(
      {required String transactionId}) async {
    try {
      final response =
          await ApiRequest.post(url: "trans/cek-status", useToken: true, body: {
        "transaction_id": transactionId,
      });
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> createTransactionRoomChat(
      {required int userId, required String transactionId}) async {
    try {
      final response =
          await ApiRequest.post(url: "users/cr", useToken: true, body: {
        "notaris_id": userId,
        "transaction_id": transactionId,
      });
      return ApiResponse.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TransactionHistory>> getListHistory() async {
    try {
      final response =
          await ApiRequest.get(url: "trans/get-all", useToken: true);
      return (response.data['data'] as List)
          .map((data) => TransactionHistory.fromJson(data))
          .toList()
          .cast<TransactionHistory>();
    } catch (e) {
      rethrow;
    }
  }
}
