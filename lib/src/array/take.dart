List<T> take<T>(List<T> list, [int n = 1]) {
  if (list.isEmpty) return [];
  if (n <= 0) return [];
  return list.sublist(0, n >= list.length ? list.length : n);
}
