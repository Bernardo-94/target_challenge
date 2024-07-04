import 'package:flutter/material.dart';
import 'package:target_challenge/project/shared/validators.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String fieldName;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  const TextFormFieldCustom({
    super.key,
    required this.fieldName,
    this.controller,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 22.0,
          ),
          child: Text(
            fieldName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 310,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 15.0,
              right: 15.0,
            ),
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (fieldName == 'Usuário') {
                  return Validators.validateUser(value);
                } else if (fieldName == 'Senha') {
                  return Validators.validatePassword(value);
                } else {
                  return null;
                }
              },
              obscureText: fieldName == 'Senha' ? true : false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  prefixIcon,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                errorStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
