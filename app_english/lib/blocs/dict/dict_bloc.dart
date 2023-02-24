import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:bloc/bloc.dart';

import 'dict_state.dart';

class DictsBloc extends Bloc<DictEvent, DictState> {
  DictsBloc() : super(const DictState()) {
    on<AddDict>(_onAddDict);
    on<ChangeDict>(_onChangeDict);
    on<DeleteDict>(_onDeleteDict);
  }

  void _onAddDict(AddDict event, Emitter<DictState> emit) {
    final state = this.state;
    emit(
      DictState(
        allDicts: List.from(state.allDicts)..add(event.name),
      ),
    );
  }

  void _onChangeDict(ChangeDict event, Emitter<DictState> emit) {}

  void _onDeleteDict(DeleteDict event, Emitter<DictState> emit) {}
}
