import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/chatrooms/chat_rooms_state.dart';
import '../../model/chat_room_model.dart';
import 'chatroom_repository.dart';

class ChatRoomStateNotifier extends StateNotifier<ChatRoomsState> {

  ChatRoomStateNotifier(this.repository) : super(const ChatRoomsState.initial());
  final ChatRoomRepository repository;

  Future<void> getChatRoomDetailsByUserId({required String currentUserId}) async {
    state = const ChatRoomsState.loading();
    final response = await repository.getChatRooms(currentUserId: currentUserId);
    var chatRoomsList = List.empty();
    if(response.isRight()) {
      chatRoomsList = response.getOrElse(() => List.empty());
    }
    state = ChatRoomsState.chatRooms(chatRooms: chatRoomsList as List<ChatRoomModel>);
  }
}

final chatRoomProvider = StateNotifierProvider<ChatRoomStateNotifier, ChatRoomsState>(
      (ref) => ChatRoomStateNotifier(ref.read(chatRoomsRepoProvider)),
);