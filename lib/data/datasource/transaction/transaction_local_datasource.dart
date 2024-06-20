import 'package:aktaris_app/config/base/cache_mixin.dart';
import 'package:aktaris_app/core/database/cache/cache_key.dart';
import 'package:aktaris_app/data/datasource/transaction/transaction_remote_datasource.dart';

import '../../model/transaction/transaction_history.dart';

abstract class TransactionLocalDatasource {
  Future<List<TransactionHistory>> getListHistory();
}

class TransactionLocalDatasourceImpl
    with CacheMixin
    implements TransactionLocalDatasource {
  final TransactionRemoteDatasourceImpl transactionRemoteDatasourceImpl;
  TransactionLocalDatasourceImpl({required this.transactionRemoteDatasourceImpl});
  @override
  Future<List<TransactionHistory>> getListHistory() async {
    try {
      return await getCacheList(
          cachedKey: CachedKey.HISTORY_ORDER,
          onLoad: () async =>
              await transactionRemoteDatasourceImpl.getListHistory());
    } catch (e) {
      rethrow;
    }
  }
}
