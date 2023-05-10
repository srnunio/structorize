// DO NOT EDIT. This is code generated via package:not_repeat/initialize.dart

class EnumValues<T> {
  late Map<String, T> map;
  Map<T, String>? _reserseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (_reserseMap == null) {
      _reserseMap = map.map((k, v) => MapEntry(v, k));
    }
    return _reserseMap;
  }
}
