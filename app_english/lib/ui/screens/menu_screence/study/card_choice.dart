import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/blocs/dict/dict_state.dart';
import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/ui/widgets/dicts/dicts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardDicts extends StatefulWidget {
  const CardDicts({super.key});

  @override
  State<CardDicts> createState() => _CardDictsState();
}

class _CardDictsState extends State<CardDicts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictsBloc, DictState>(builder: (context, state) {
      List<Dictionary> dictsList = state.allDicts;
      return Scaffold(
        appBar: AppBar(
          title: Text("Chouse dictionary "),
        ),
        body: Column(
          children: [
            DictsList(
              dictsList: dictsList,
            ),
          ],
        ),
      );
    });
  }
}
