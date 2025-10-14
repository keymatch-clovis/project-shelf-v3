// These are the same as the [intl] package from flutter. But these are used
// outside of flutter. For like printing or generating reports in other spaces
// like... erm... printing invoices.
enum ShelfString {
  PRODUCT,
  UNIT_ABBREVIATED,
  VALUE,
  TOTAL,
  REMAINING_UNPAID_BALANCE,
}

abstract interface class StringService {
  String getInvoiceDocumentString(String document);

  String getShelfString(ShelfString shelfString);
}
