extension NullFunctions on String {
  String? get nullIfEmpty {
    return isEmpty ? null : this;
  }
}
