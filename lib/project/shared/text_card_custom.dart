import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_challenge/project/home_page/store/text_list_store.dart';

class TextCardCustom extends StatelessWidget {
  final String? text;
  final int index;
  final TextListStore textListStore;
  const TextCardCustom({
    super.key,
    required this.text,
    required this.index,
    required this.textListStore,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 180,
        minHeight: 50,
      ),
      child: Card(
        child: Observer(
          builder: (context) => Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                ),
                child: SizedBox(
                  width: 175,
                  child: Text(
                    text ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                ),
                child: GestureDetector(
                  child: const SizedBox(
                    width: 15,
                    height: 30,
                    child: Icon(
                      Icons.border_color_sharp,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    textListStore.editText(index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                ),
                child: GestureDetector(
                  child: const SizedBox(
                    width: 15,
                    height: 30,
                    child: Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () async {
                    bool confirmDelete = await _showConfirmationDialog(context);
                    if (confirmDelete) {
                      await textListStore.removeText(index);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmar exclusão'),
              content: const Text('Deseja realmente excluir este texto?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
