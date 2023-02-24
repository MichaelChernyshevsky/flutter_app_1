import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:app_english/blocs/dict/dict_state.dart';
import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/models/dictionaryes/word.dart';
import 'package:app_english/ui/widgets/bottombar/bottombar_widget.dart';
import 'package:app_english/ui/widgets/dicts/alert.dialog.dart';
import 'package:app_english/ui/widgets/dicts/dicts_list.dart';
import 'package:flutter/material.dart';

class DictionariesScreen extends StatefulWidget {
  const DictionariesScreen({super.key});

  @override
  State<DictionariesScreen> createState() => _DictionariesScreenState();
}

class _DictionariesScreenState extends State<DictionariesScreen> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictsBloc, DictState>(
      builder: (context, state) {
        List<Dictionary> dictsList = state.allDicts;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Dictionaries"),
            actions: [
              IconButton(
                  onPressed: () {
                    ShowAlertDialog(context, name);
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          body: Column(
            children: [
              DictsList(
                dictsList: dictsList,
              ),
            ],
          ),
          bottomNavigationBar: const BottomBar(),
        );
      },
    );
  }
}
