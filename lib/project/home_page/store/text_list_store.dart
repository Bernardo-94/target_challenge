// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'text_list_store.g.dart';

class TextListStore = _TextListStore with _$TextListStore;

abstract class _TextListStore with Store {
  @observable
  ObservableList<String> textList = ObservableList<String>();

  @observable
  bool isEditing = false;

  @observable
  String? editedText;

  @observable
  int? editIndex;

  @action
  Future<void> addText(String text) async {
    textList.add(text);
    await _saveTexts();
  }

  @action
  Future<void> removeText(int index) async {
    textList.removeAt(index);
    await _saveTexts();
  }

  @action
  void editText(int index) {
    isEditing = true;
    editIndex = index;
  }

  @action
  Future<void> saveEditedText(int index, String newText) async {
    textList[index] = newText;
    await _saveTexts();
    isEditing = false;
    editIndex = null;
  }

  @action
  Future<void> _saveTexts() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('texts', textList.toList());
  }

  @action
  Future<void> loadTexts() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTexts = prefs.getStringList('texts') ?? [];
    textList.addAll(savedTexts);
  }
}
