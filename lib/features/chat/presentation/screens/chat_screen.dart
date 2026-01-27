import 'package:flutter/material.dart';
import 'package:tamenny/features/chat/data/models/message_model.dart';
import '../../data/repositories/chat_repo.dart';
import 'package:tamenny/features/chat/presentation/widgets/message_buble.dart';
import '../widgets/chat_input_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatRepository repo = ChatRepository();
  final TextEditingController controller = TextEditingController();
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  Future<void> loadMessages() async {
    messages = await repo.getMessages();
    setState(() {});
  }

  void sendMessage() {
    if (controller.text.isEmpty) return;

    final newMessage = MessageModel(
      id: DateTime.now().toString(),
      text: controller.text,
      isMe: true,
      createdAt: DateTime.now(),
    );

    setState(() => messages.add(newMessage));
    controller.clear();

    repo.sendMessage(newMessage.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F1EC),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Tammmenny Chat",
          style: TextStyle(
            color: Color(0xFF1C3E52),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) => MessageBubble(
                message: messages[index],
              ),
            ),
          ),
          ChatInputField(
            controller: controller,
            onSend: sendMessage,
          ),
        ],
      ),
    );
  }
}
