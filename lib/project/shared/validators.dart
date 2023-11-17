class Validators {
  static String? validateUser(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo não pode estar vazio';
    }

    if (value.length > 20) {
      return 'Este campo deve ter no máximo 20 caracteres';
    }

    if (value.trim() != value) {
      return 'Este campo não pode ter espaços no final';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo não pode estar vazio';
    }

    if (value.length > 20) {
      return 'Este campo deve ter no máximo 20 caracteres';
    }

    if (value.length < 2) {
      return 'Este campo deve ter no mínimo 2 caracteres';
    }

    if (value.trim() != value) {
      return 'Este campo não pode ter espaços no final';
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Somente letras (a-Z) e números (0-9)';
    }

    return null;
  }
}
