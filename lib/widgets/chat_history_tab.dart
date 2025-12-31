import 'package:flutter/material.dart';
import 'package:mini_chat_app/screens/chat_screen.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class ChatHistoryTab extends StatelessWidget {
  const ChatHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final users = chatProvider.chattedUsers;

    return users.isEmpty
        ? const Center(child: Text("No chats yet"))
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, i) {
              final userName = users[i];
              final lastMessage = chatProvider.getLastMessage(userName);

              return ListTile(
                leading: CircleAvatar(child: Text(userName[0].toUpperCase())),
                title: Text(userName),
                subtitle: Text(
                  lastMessage?.text ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(userName: userName),
                    ),
                  );
                },
              );
            },
          );
  }
}
