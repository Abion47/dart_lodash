List<List<dynamic>> unzip(List<List<dynamic>> list) {
  if (list.isEmpty) return [];

  int length = list[0].length;
  for (final nested in list.skip(1)) {
    length = nested.length < length ? nested.length : length;
  }

  final output = <List<dynamic>>[];
  for (int i = 0; i < length; i++) {
    output.add([
      ...list.map((l) => l[i]).toList(),
    ]);
  }

  return output;
}
