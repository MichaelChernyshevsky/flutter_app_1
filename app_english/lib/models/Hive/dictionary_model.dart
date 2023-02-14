import 'package:app_english/models/Hive/word_model.dart';
import 'package:hive/hive.dart';
part 'dictionary_model.g.dart';

@HiveType(typeId: 0)
class Dictionary {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final List<Word>? dict;

  Dictionary({
    this.name,
    this.dict,
  });
}
