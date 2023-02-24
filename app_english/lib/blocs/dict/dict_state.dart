import 'package:equatable/equatable.dart';
import '../../models/dictionaryes/dictionary.dart';

class DictState extends Equatable {
  final List<Dictionary> allDicts;
  const DictState({
    this.allDicts = const <Dictionary>[],
  });

  @override
  List<Object> get props => [allDicts];
}
