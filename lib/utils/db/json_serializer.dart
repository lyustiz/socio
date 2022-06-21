import 'package:drift/drift.dart';

class JsonSerializer extends ValueSerializer {
  const JsonSerializer();

  @override
  fromJson<T>(dynamic json) {
    if (json == null) {
      return null as T;
    }

    final _typeList = <T>[];

    if (_typeList is List<DateTime?>) {
      return DateTime.parse(json as String) as T;
    }

    if (_typeList is List<double?> && json is int) {
      return json.toDouble() as T;
    }

    if (_typeList is List<Uint8List?> && json is! Uint8List) {
      final asList = (json as List).cast<int>();
      return Uint8List.fromList(asList) as T;
    }

    if (_typeList is List<bool?> && json is! bool) {
      return (json == 1) as T;
    }

    return json as T;
  }

  @override
  dynamic toJson<T>(T value) {
    if (value is DateTime) {
      return value.millisecondsSinceEpoch;
    }

    return value;
  }
}
