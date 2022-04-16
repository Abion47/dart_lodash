Map<TKey, TValue> zipObject<TKey, TValue>(
  List<TKey> keys,
  List<TValue> values,
) {
  if (keys.length != values.length) {
    throw ArgumentError.value(
        values.length, 'values', 'The length of the arrays must match');
  }

  return Map.fromIterables(keys, values);
}
