class ValidationMixin {
  String? validateEmail(String? value) {
    if (value!.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  String? validatePassword(String? value) {
    var holder = value.toString();
    if (!holder.contains('@')) {
      return 'Please Enter a Value';
    }
    return null;
  }
}
