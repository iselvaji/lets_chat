import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lets_chat/features/chat/chat_repository.dart';
import 'package:lets_chat/features/chat/chat_screen_state.dart';
import 'package:lets_chat/model/chat_model.dart';

class ChatStateNotifier extends StateNotifier<ChatState> {

  ChatStateNotifier(this.repository) : super(const ChatState.initial());
  final ChatRepository repository;

  Future<void> getChatDetailsByUserId({required String currentUserId, required String friendId}) async {
    state = const ChatState.loading();
    final response = await repository.getChatDetailsByUserId(currentUserId: currentUserId, friendId: friendId);
    var chats = List.empty();
    if(response.isRight()) {
      chats = response.getOrElse(() => List.empty());
    }
    state = ChatState.chats(chats: chats as List<ChatModel>);
  }

  Future<void> saveChatMessage({required String currentUserId, required String friendId, required String message}) async {
    var dataSaved = await repository.saveChatMessage(currentUserId: currentUserId, friendId: friendId, message: message);
    if(dataSaved.isRight()) {
      getChatDetailsByUserId(currentUserId: currentUserId, friendId: friendId);
    }
  }
}

final chatProvider = StateNotifierProvider<ChatStateNotifier, ChatState>(
      (ref) => ChatStateNotifier(ref.read(chatRepoProvider)),
);