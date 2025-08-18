abstract interface class CityRepository {
  /// CREATE related
  Future<void> create(Iterable<({String name, String department})> items);
}
