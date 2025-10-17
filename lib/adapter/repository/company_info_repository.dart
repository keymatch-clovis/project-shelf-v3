final class CreateArgs {
  final int id;
  final String? logoFileName;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  const CreateArgs({
    required this.id,
    this.logoFileName,
    this.name,
    this.document,
    this.email,
    this.phone,
  });
}

abstract interface class CompanyInfoRepository {
  Future<Iterable<dynamic>> get();
  Future<void> create(CreateArgs args);
}
