import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:flutter/material.dart';

class DictsList extends StatelessWidget {
  const DictsList({
    super.key,
    required this.dictsList,
  });

  final List<Dictionary> dictsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dictsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(
                dictsList[index].name,
              ),
            ),
          );
        },
      ),
    );
  }
}
