// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextListStore on _TextListStore, Store {
  late final _$textListAtom =
      Atom(name: '_TextListStore.textList', context: context);

  @override
  ObservableList<String> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(ObservableList<String> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$isEditingAtom =
      Atom(name: '_TextListStore.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$editedTextAtom =
      Atom(name: '_TextListStore.editedText', context: context);

  @override
  String? get editedText {
    _$editedTextAtom.reportRead();
    return super.editedText;
  }

  @override
  set editedText(String? value) {
    _$editedTextAtom.reportWrite(value, super.editedText, () {
      super.editedText = value;
    });
  }

  late final _$editIndexAtom =
      Atom(name: '_TextListStore.editIndex', context: context);

  @override
  int? get editIndex {
    _$editIndexAtom.reportRead();
    return super.editIndex;
  }

  @override
  set editIndex(int? value) {
    _$editIndexAtom.reportWrite(value, super.editIndex, () {
      super.editIndex = value;
    });
  }

  late final _$addTextAsyncAction =
      AsyncAction('_TextListStore.addText', context: context);

  @override
  Future<void> addText(String text) {
    return _$addTextAsyncAction.run(() => super.addText(text));
  }

  late final _$removeTextAsyncAction =
      AsyncAction('_TextListStore.removeText', context: context);

  @override
  Future<void> removeText(int index) {
    return _$removeTextAsyncAction.run(() => super.removeText(index));
  }

  late final _$saveEditedTextAsyncAction =
      AsyncAction('_TextListStore.saveEditedText', context: context);

  @override
  Future<void> saveEditedText(int index, String newText) {
    return _$saveEditedTextAsyncAction
        .run(() => super.saveEditedText(index, newText));
  }

  late final _$_saveTextsAsyncAction =
      AsyncAction('_TextListStore._saveTexts', context: context);

  @override
  Future<void> _saveTexts() {
    return _$_saveTextsAsyncAction.run(() => super._saveTexts());
  }

  late final _$loadTextsAsyncAction =
      AsyncAction('_TextListStore.loadTexts', context: context);

  @override
  Future<void> loadTexts() {
    return _$loadTextsAsyncAction.run(() => super.loadTexts());
  }

  late final _$_TextListStoreActionController =
      ActionController(name: '_TextListStore', context: context);

  @override
  void editText(int index) {
    final _$actionInfo = _$_TextListStoreActionController.startAction(
        name: '_TextListStore.editText');
    try {
      return super.editText(index);
    } finally {
      _$_TextListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textList: ${textList},
isEditing: ${isEditing},
editedText: ${editedText},
editIndex: ${editIndex}
    ''';
  }
}
