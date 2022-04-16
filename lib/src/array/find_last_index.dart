int findLastIndex<T>(
  List<T> list,
  bool Function(T) predicate, [
  int? fromIndex,
]) {
  return list.lastIndexWhere(predicate, fromIndex);
}
