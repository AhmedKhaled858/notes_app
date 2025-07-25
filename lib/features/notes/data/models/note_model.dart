import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  String date;

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date,
  });
}
