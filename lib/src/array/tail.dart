List<T> tail<T>(List<T> list) {
  if (list.isEmpty) return [];
  return list.skip(1).toList();
}
