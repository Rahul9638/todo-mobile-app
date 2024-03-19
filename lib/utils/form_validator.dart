class FormValidator {
  static final RegExp emailRegex =
      RegExp(r'^([a-zA-Z0-9_\-\+\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,10})$');

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email id is required';
    } else if (value.isNotEmpty && !emailRegex.hasMatch(value)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.isNotEmpty && value.length < 3) {
      return 'Password must be greater than 3 character';
    } else {
      return null;
    }
  }
}
