import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;

  UserModel(this.name);

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';
}
