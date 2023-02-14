import 'package:hive/hive.dart';
part 'word_model.g.dart';

@HiveType(typeId: 0)
class Word {
  @HiveField(0)
  final String? foreign;

  @HiveField(1)
  final String? translation;

  Word({
    this.foreign,
    this.translation,
  });
}
