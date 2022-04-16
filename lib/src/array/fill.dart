List<T> fill<T>(List<T> list, T value, int start, [int? end]) {
  if (start < 0) start = 0;
  if (end == null || end > list.length) end = list.length;

  if (start > end) {
    throw ArgumentError.value(
        start, 'start', 'start must be less than or equal to end');
  }

  return list..fillRange(start, end, value);
}
