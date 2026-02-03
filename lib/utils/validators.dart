class Validators {

  // ===== Name =====
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  // ===== Email =====
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter your email";
    }

    if (!value.contains("@") || !value.contains(".")) {
      return "Please enter valid email";
    }

    return null;
  }

  // ===== Phone =====
  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Please enter phone number";
    }

    if (value.length < 11) {
      return "Phone number must be 11 digits";
    }

    return null;
  }

  // ===== Password =====
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    return null;
  }
}
