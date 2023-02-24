import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:equatable/equatable.dart';

abstract class DictEvent extends Equatable {
  const DictEvent();

  @override
  List<Object> get props => [];
}

class AddDict extends DictEvent {
  final Dictionary name;

  AddDict({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}

class AddWord extends DictEvent {
  final Dictionary dict;
  const AddWord({
    required this.dict,
  });

  @override
  List<Object> get props => [dict];
}

class ChangeDict extends DictEvent {
  final Dictionary dict;
  const ChangeDict({
    required this.dict,
  });

  @override
  List<Object> get props => [dict];
}

class DeleteDict extends DictEvent {
  final Dictionary dict;
  const DeleteDict({
    required this.dict,
  });

  @override
  List<Object> get props => [dict];
}
