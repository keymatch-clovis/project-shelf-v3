abstract interface class StringService {
  Future<String> getInvoiceDocument(String locale, {required String document});
}
