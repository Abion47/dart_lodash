List<T> takeRight<T>(List<T> list, [int n = 1]) {
  if (list.isEmpty) return [];
  if (n <= 0) return [];
  return list.sublist(n >= list.length ? 0 : list.length - n, list.length);
}
