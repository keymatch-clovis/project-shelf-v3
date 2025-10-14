final class CompanyInfoResponse {
  final String? logoFileName;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  const CompanyInfoResponse({
    this.logoFileName,
    this.name,
    this.document,
    this.email,
    this.phone,
  });

  bool get isFilled => <bool>[
    // We don't need to check the [logoFileName], as we are using default
    // images for that.
    // logoFileName != null,
    name != null,
    document != null,
    email != null,
    phone != null,
  ].every((it) => it);

  CompanyInfoResponse copyWith({
    String? logoFileName,
    String? name,
    String? document,
    String? email,
    String? phone,
  }) {
    return CompanyInfoResponse(
      logoFileName: logoFileName ?? this.logoFileName,
      name: name ?? this.name,
      document: document ?? this.document,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
