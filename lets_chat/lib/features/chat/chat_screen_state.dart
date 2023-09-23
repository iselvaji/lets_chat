
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/chat_model.dart';
part 'chat_screen_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.chats({required List<ChatModel> chats}) =_Chats;
}