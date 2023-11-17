import 'package:flutter/material.dart';
import 'package:target_challenge/project/main_design.view.dart';
import 'package:target_challenge/project/shared/text_form_field_custom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: MainDesign(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextFormFieldCustom(
                fieldName: 'Usuário',
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextFormFieldCustom(
                fieldName: 'Senha',
                prefixIcon: Icons.lock,
              ),
              const SizedBox(
                height: 25,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 150,
                  maxWidth: 150,
                  minHeight: 40,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF44bd6e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
