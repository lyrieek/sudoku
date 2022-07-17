class DataTransient {
  static Map<String, String> data = {};

  static Map<String, Function(String)> watchArray = {};

  static storage(String key, String val) {
    data[key] = val;
    watchArray[key]?.call(val);
  }

  static record(String key, int val) {
    storage(key, "$val");
  }

  static move(String oldKey, String newKey) {
    data[newKey] = data[oldKey] ?? "";
    data.remove(oldKey);
  }

  static int get(String key) {
    return int.parse(data[key] ?? "0");
  }

  static String str(String key) {
    return data[key] ?? "";
  }

  static bool has(String key) {
    return data[key] != null && data[key] != "";
  }

  static watch(String key, Function(String) fn) {
    watchArray[key] = fn;
  }

  static watchOne(String key, Function(String) fn) {
    watchArray[key] = (newVal) {
      watchArray.remove(key);
      fn.call(newVal);
    };
  }
}
