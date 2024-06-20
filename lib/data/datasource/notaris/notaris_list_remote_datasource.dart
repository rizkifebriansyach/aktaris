import 'package:aktaris_app/config/network/api_request.dart';
import 'package:aktaris_app/data/model/notaris_model.dart';
import 'package:flutter/material.dart';

abstract class NotarisListRemoteDatasource {
  Future<List<NotarisModel>> getNotarisList();
}

class NotarisListRemoteDatasourceImpl implements NotarisListRemoteDatasource {
  String tag = 'Notaris Api';
  @override
  Future<List<NotarisModel>> getNotarisList(
    ) async {
    try {
      final response =
          await ApiRequest.get(url: 'users/search',);
      return (response.data['data'] as List)
          .map((data) => NotarisModel.fromJson(data))
          .toList()
          .cast<NotarisModel>();
    } catch (e) {
      debugPrint("$tag : $e");
      rethrow;
    }
  }
}
