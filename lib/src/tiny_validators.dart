class TinyValidators {
  /// making singleton
  static TinyValidators _instance = TinyValidators.internal();
  TinyValidators.internal();
  factory TinyValidators() => _instance;

  /// Validating email address
  String emailValidator(String value) {
    if (value.length < 1)
      return 'Can\'t be empty';
    else {
      if (value.length > 3 && value.contains('@') && value.contains('.')) {
        return null;
      } else {
        return 'Wrong Email Address';
      }
    }
  }

  /// Validating password
  String passValidator(String value) {
    if (value.length < 1)
      return 'Can\'t be empty';
    else {
      if (value.length > 6 &&
          value.contains(RegExp('[A-Z]')) &&
          value.contains(RegExp('[a-z]')) &&
          value.contains(RegExp('[0-9]'))) {
        return null;
      } else {
        return 'Please Enter Strong Pass with Letters and Numbers';
      }
    }
  }

  /// Validating name (just can't be empty for now)
  String nameValidator(String value) {
    if (value.length < 1)
      return 'Can\'t be empty';
    else
      return null;
  }

  /// Validating user's phone number
  String phoneValidator(String value) {
    if (value.length < 1)
      return 'Can\'t be empty';
    else if (value.length == 11 &&
        (value.substring(0, 3) == '010' ||
            value.substring(0, 3) == '011' ||
            value.substring(0, 3) == '012' ||
            value.substring(0, 3) == '015') &&
        !value.contains(RegExp('[a-z]')) &&
        !value.contains(RegExp('[A-Z]')))
      return null;
    else
      return 'Wrong Phone Number';
  }
}
