class Validator {
  //todo : user name validatior if tha name not start with @
  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!value.startsWith('@')) {
      return 'Please enter valid user name';
    }
    return null;
  } 
}