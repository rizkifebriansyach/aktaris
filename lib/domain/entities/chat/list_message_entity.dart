import 'package:aktaris_app/data/model/chat/chat_model.dart';
import 'package:equatable/equatable.dart';

class MessageListEntity extends Equatable {
 late List<Message>? messages;

  @override
  List<Object?> get props => [messages];
}
