import 'package:aktaris_app/config/base/cache_mixin.dart';
import 'package:aktaris_app/core/database/cache/cache_key.dart';
import 'package:aktaris_app/data/datasource/notaris/notaris_list_remote_datasource.dart';
import 'package:aktaris_app/data/model/notaris_model.dart';

abstract class NotarisListLocalDatasource {
  Future<List<NotarisModel>> getNotarisList();
}

class NotarisListLocalDatasourceImpl
    with CacheMixin
    implements NotarisListLocalDatasource {
  final NotarisListRemoteDatasourceImpl notarisListRemoteDatasourceImpl;
  NotarisListLocalDatasourceImpl(
      {required this.notarisListRemoteDatasourceImpl});

  @override
  Future<List<NotarisModel>> getNotarisList() async {
    try {
      return await getCacheList(
          cachedKey: CachedKey.NOTARIS_LIST,
          onLoad: () async =>
              await notarisListRemoteDatasourceImpl.getNotarisList());
    } catch (e) {
      rethrow;
    }
  }
}
