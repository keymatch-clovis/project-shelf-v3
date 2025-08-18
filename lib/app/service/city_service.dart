abstract interface class CityService {
  /// CREATE related
  Future<void> create(Iterable<({String name, String department})> input);
}
