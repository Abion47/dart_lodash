int findIndex<T>(
  List<T> list,
  bool Function(T) predicate, [
  int fromIndex = 0,
]) {
  return list.indexWhere(predicate, fromIndex);
}
