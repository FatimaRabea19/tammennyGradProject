import 'package:tamenny/features/chat/data/models/message_model.dart';
class ChatRepository {
  Future<List<MessageModel>> getMessages() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      MessageModel(
        id: "1",
        text: "Hello! How can I assist you?",
        isMe: false,
        createdAt: DateTime.now(),
      ),
      MessageModel(
        id: "2",
        text: "I want to ask something.",
        isMe: true,
        createdAt: DateTime.now(),
      ),
      MessageModel(
        id: "3",
        text: "Sure! Go ahead.",
        isMe: false,
        createdAt: DateTime.now(),
      ),
    ];
  }

  Future<void> sendMessage(String text) async {
    // هتربطي بالـ API هنا
  }
}
