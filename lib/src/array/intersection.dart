List<T> intersection<T>(List<T> a, List<T> b) {
  final ref = Set<T>.from(b);
  return a.where((e) => ref.contains(e)).toList();
}
