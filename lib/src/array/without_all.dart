List<T> withoutAll<T>(List<T> list, List<T> values) {
  if (list.isEmpty) return [];
  final ref = Set<T>.from(values);
  return list.where((e) => !ref.contains(e)).toList();
}
