import 'package:aktaris_app/data/model/notaris_model.dart';
import 'package:equatable/equatable.dart';

class NotarisListEntity extends Equatable {
  NotarisDetails? notarisDetails;
  OnlineHistory? onlineHistory;
  Price? price;

  @override
  List<Object?> get props => [notarisDetails, onlineHistory, price];
}
