Map<TKey, TValue> fromPairs<TKey, TValue>(List<List<dynamic>> pairs) {
  return Map<TKey, TValue>.fromIterable(
    pairs,
    key: (e) {
      if (e.length != 2) {
        throw ArgumentError.value(pairs, 'pairs',
            'Each nested list in pairs must be exactly 2 elements long');
      }
      if (e[0] is! TKey) {
        throw ArgumentError.value(pairs, 'pairs',
            'The first element in each nested list must be castable to type $TKey');
      }
      return e[0] as TKey;
    },
    value: (e) {
      if (e.length != 2) {
        throw ArgumentError.value(pairs, 'pairs',
            'Each nested list in pairs must be exactly 2 elements long');
      }
      if (e[1] is! TValue) {
        throw ArgumentError.value(pairs, 'pairs',
            'The second element in each nested list must be castable to type $TValue');
      }
      return e[1] as TValue;
    },
  );
}
