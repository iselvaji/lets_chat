import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lets_chat/model/chat_room_model.dart';
part 'chat_rooms_state.freezed.dart';

@freezed
class ChatRoomsState<T> with _$ChatRoomsState {
  const factory ChatRoomsState.initial() = _Initial;
  const factory ChatRoomsState.loading() = _Loading;
  const factory ChatRoomsState.chatRooms({required List<ChatRoomModel> chatRooms}) =_ChatRooms;
}