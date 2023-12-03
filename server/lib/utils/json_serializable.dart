class JsonSerializableUtils {
  static bool stringToBoolFromJson(String? json) {
    if (json == null) return false;
    return json.toLowerCase() == 'true';
  }

  static String stringToBoolToJson(bool value) {
    return value.toString();
  }

  static int stringToIntFromJson(String? json) {
    if (json == null) return 0;
    return int.parse(json);
  }

  static String stringToIntToJson(int value) {
    return value.toString();
  }
}
