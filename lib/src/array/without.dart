List<T> without<T>(List<T> list, T value) {
  if (list.isEmpty) return [];
  return list.where((e) => e != value).toList();
}
