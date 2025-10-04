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
