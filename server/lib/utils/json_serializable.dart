class JsonSerializableUtils {
  static bool stringToBoolFromJson(String? json) {
    if (json == null) return false;
    return json.toLowerCase() == 'true';
  }

  static String stringToBoolToJson(bool value) {
    return value.toString();
  }
}
