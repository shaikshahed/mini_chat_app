import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_chat_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'models/message_model.dart';
import 'providers/user_provider.dart';
import 'providers/chat_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MessageTypeAdapter());
  Hive.registerAdapter(MessageModelAdapter());

  await Hive.openBox<UserModel>('users');
  await Hive.openBox('chats');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Chat',
        theme: ThemeData(useMaterial3: true),
        home: const MainScreen(),
      ),
    );
  }
}
