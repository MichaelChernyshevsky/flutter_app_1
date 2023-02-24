import 'package:app_english/models/dictionaryes/word.dart';
import 'package:flutter/material.dart';

int count = 1;

class Dictionary {
  String name;
  late List<Word> words;

  Dictionary(this.name);

  void AddWord(Word word) {
    words.add(word);
  }
}
