// Validation regex for SONA and Qualtrics participant ID codes
// (Feel free to add additional participant ID patterns as necessary)

class IDRegex {
  static final RegExp sonaPattern = new RegExp(r'^U\d{8}$');
  static final RegExp qualtricsPattern =
      new RegExp(r'^\d{7}$|^\d{1},\d{3},\d{3}$');
}
