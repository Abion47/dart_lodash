Iterable<TOut> flatMap<TIn, TOut>(
  Iterable<TIn> iterable,
  Iterable<TOut> Function(TIn, int, Iterable<TIn>) iteratee,
) sync* {
  int idx = 0;
  for (final elem in iterable) {
    yield* iteratee(elem, idx, iterable);
  }
}
