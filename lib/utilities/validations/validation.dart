class Validation {
  static checkText(String text, String name) {
    if (text.toString().isEmpty) {
      return "please fill the $name";
    } else {
      return null;
    }
  }
}
