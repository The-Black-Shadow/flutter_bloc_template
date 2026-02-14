extension StringExt on String {
  // Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Email Validation
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }
}
//Usages
// Text("hello world".capitalize); // Output: Hello world

// if (myController.text.isValidEmail) { ... }
