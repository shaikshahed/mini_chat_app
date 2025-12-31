import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/message_model.dart';
import '../services/message_api_service.dart';

class ChatProvider extends ChangeNotifier {
  late Box _chatBox;

  ChatProvider() {
    _chatBox = Hive.box('chats');
  }

  List<MessageModel> getMessages(String userName) {
    return (_chatBox.get(userName, defaultValue: []) as List)
        .cast<MessageModel>();
  }

  List<String> get chattedUsers => _chatBox.keys.cast<String>().toList();

  MessageModel? getLastMessage(String userName) {
    final messages = getMessages(userName);
    return messages.isEmpty ? null : messages.last;
  }

  Future<void> sendMessage({
    required String userName,
    required String text,
  }) async {
    final messages = getMessages(userName);

    messages.add(
      MessageModel(text: text, type: MessageType.sender, time: DateTime.now()),
    );

    _chatBox.put(userName, messages);
    notifyListeners();

    final reply = await MessageApiService.fetchReceiverMessage();

    messages.add(
      MessageModel(
        text: reply,
        type: MessageType.receiver,
        time: DateTime.now(),
      ),
    );

    _chatBox.put(userName, messages);
    notifyListeners();
  }
}
