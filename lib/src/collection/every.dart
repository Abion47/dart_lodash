bool every<T>(Iterable<T> iterable, bool Function(T) predicate) {
  if (iterable.isEmpty) return true;
  return iterable.every(predicate);
}
