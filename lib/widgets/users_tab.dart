import 'package:flutter/material.dart';
import 'package:mini_chat_app/screens/chat_screen.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.watch<UserProvider>().users;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _addUserDialog(context),
      ),
      body: users.isEmpty
          ? const Center(child: Text("No users added"))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) {
                final user = users[i];
                return ListTile(
                  leading: CircleAvatar(child: Text(user.initial)),
                  title: Text(user.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(userName: user.name),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  void _addUserDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add User"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter user name"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                context.read<UserProvider>().addUser(controller.text.trim());
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}