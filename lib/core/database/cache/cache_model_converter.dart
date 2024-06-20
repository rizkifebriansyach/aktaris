import 'package:aktaris_app/data/model/notaris_model.dart';
import 'package:aktaris_app/data/model/transaction/transaction_history.dart';
import 'package:json_annotation/json_annotation.dart';

bool typeEqual<S, T>() => S == T;

bool typeEqualN<S, T>() {
  return typeEqual<S, T>() || typeEqual<S?, T?>();
}

///
/// Every cache model must be registered here
///
class CachedModelConverter<T> implements JsonConverter<T, Object> {
  const CachedModelConverter();

  @override
  T fromJson(Object? json) {
    json = json as Map<String, dynamic>;
    if (typeEqualN<T, NotarisModel>()) {
      return NotarisModel.fromJson(json) as T;
    } else if (typeEqualN<T, TransactionHistory>()) {
      return TransactionHistory.fromJson(json) as T;
    }
    // else if (typeEqualN<T, User>()) {
    //   return User.fromJson(json) as T;
    // } else if (typeEqualN<T, DocInfo>()) {
    //   return DocInfo.fromJson(json) as T;
    // }
    ///
    /// Add other models
    ///
    ///
    throw UnimplementedError('`$T` fromJson factory unimplemented.');
  }

  @override
  Map<String, dynamic> toJson(T obj) {
    if (typeEqualN<T, NotarisModel>()) {
      return (obj as NotarisModel).toJson();
    } else if (typeEqualN<T, TransactionHistory>()) {
      return (obj as TransactionHistory).toJson();
    }
    //  else if (typeEqualN<T, User>()) {
    //   return (obj as User).toJson();
    // } else if (typeEqualN<T, DocInfo>()) {
    //   return (obj as DocInfo).toJson();
    // }
    ///
    /// Add other models
    ///

    throw UnimplementedError('`$T` toJson factory unimplemented.');
  }
}
