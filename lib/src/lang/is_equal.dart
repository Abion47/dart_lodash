import 'package:collection/collection.dart';

bool isEqual(dynamic value, dynamic other) {
  if (value is List && other is List) {
    return DeepCollectionEquality().equals(value, other);
  }
  if (value is Set && other is Set) {
    return SetEquality().equals(value, other);
  }
  if (value is Map && other is Map) {
    return MapEquality().equals(value, other);
  }
  if (value is Iterable && other is Iterable) {
    return IterableEquality().equals(value, other);
  }

  return value == other;
}
