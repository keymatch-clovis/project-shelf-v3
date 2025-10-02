extension NullFunctions on String? {
  String? get nullIfEmpty {
    if (this == null) {
      return null;
    }

    return this!.isEmpty ? null : this;
  }
}
