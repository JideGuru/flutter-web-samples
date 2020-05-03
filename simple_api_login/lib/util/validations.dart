class Validations {
  static String validateName(String value) {
    if (value.isEmpty) return 'Name is Required.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  static String validateEmail(String value, [bool isRequired = true]) {
    if (value.isEmpty && isRequired) return 'Email is required.';
    final RegExp nameExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!nameExp.hasMatch(value) && isRequired) return 'Invalid email address';
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return 'Password is Required.';
    return null;
  }

  static String validateRePassword(String value, String prevPass) {
    if (value.isEmpty) return 'Please re-enter your password.';
    if (prevPass != value) return 'Password does not match';
    return null;
  }
}
