import 'package:flutter/material.dart';
import '../widgets/users_tab.dart';
import '../widgets/chat_history_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
          // backgroundColor: Colors.white,
          // elevation: 1,
          // title: const Text("Home", style: TextStyle(color: Colors.black)),
          title: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Users"),
              Tab(text: "Chats"),
            ],
          ),
        ),

        body: const TabBarView(children: [UsersTab(), ChatHistoryTab()]),
      ),
    );
  }
}
