import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_challenge/project/home_page/store/text_list_store.dart';
import 'package:target_challenge/project/main_design.view.dart';
import 'package:target_challenge/project/shared/text_card_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();
    final TextListStore textListStore = TextListStore();
    textListStore.loadTexts();

    return Scaffold(
      body: MainDesign(
        child: Observer(
          builder: (_) => Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 150,
                    maxHeight: 300,
                    minWidth: 200,
                    maxWidth: 250,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView.builder(
                      itemCount: textListStore.textList.length,
                      itemBuilder: (context, index) {
                        var text = textListStore.textList[index];
                        return TextCardCustom(
                          text: text,
                          index: index,
                          textListStore: textListStore,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    maxWidth: 250,
                    minHeight: 35,
                  ),
                  child: TextFormField(
                    controller: controller,
                    onEditingComplete: () async {
                      if (formKey.currentState!.validate()) {
                        if (textListStore.isEditing == false) {
                          textListStore.addText(controller.text);
                          controller.clear();
                        } else {
                          bool confirmEdit =
                              await _showConfirmationDialog(context);
                          if (confirmEdit) {
                            await textListStore.saveEditedText(
                              textListStore.editIndex!,
                              controller.text,
                            );
                            controller.clear();
                          } else {
                            textListStore.isEditing = false;
                            controller.clear();
                          }
                        }
                      }
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Digite um texto válido';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: textListStore.isEditing == false
                          ? 'Digite seu texto'
                          : 'Edite seu texto',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      contentPadding: const EdgeInsets.only(left: 70),
                      alignLabelWithHint: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
              title: const Text('Confirmar Edição'),
              content: const Text('Deseja realmente editar este texto?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Confirmar edição
                  },
                  child: const Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Cancelar edição
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            );
          },
        ) ??
        false; // Se o usuário fechar o diálogo, consideramos como "Cancelar"
  }
}
