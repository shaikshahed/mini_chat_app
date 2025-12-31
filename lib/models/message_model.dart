import 'package:hive/hive.dart';

part 'message_model.g.dart';

@HiveType(typeId: 1)
enum MessageType {
  @HiveField(0)
  sender,
  @HiveField(1)
  receiver,
}

@HiveType(typeId: 2)
class MessageModel {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final MessageType type;

  @HiveField(2)
  final DateTime time;

  MessageModel({required this.text, required this.type, required this.time});
}
