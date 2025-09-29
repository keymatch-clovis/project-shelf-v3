// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get accept => 'Accept';

  @override
  String get total => 'Total';

  @override
  String get details => 'Details';

  @override
  String get quantity => 'Quantity';

  @override
  String get remaining_unpaid_balance => 'Remaining unpaid balance';

  @override
  String get unit_price => 'Unit price';

  @override
  String get no_products_found => 'No products found';

  @override
  String get create_customer => 'Create customer';

  @override
  String get create_invoice => 'Create invoice';

  @override
  String get photos => 'Photos';

  @override
  String get business_name => 'Business name';

  @override
  String get city => 'City';

  @override
  String get invoice_drafts => 'Invoice drafts';

  @override
  String get no_invoice_drafts_found => 'No invoice drafts found';

  @override
  String get address => 'Address';

  @override
  String get phone_number => 'Phone number';

  @override
  String get add_customer => 'Add customer';

  @override
  String get add_product => 'Add product';

  @override
  String get no_products => 'No products';

  @override
  String get no_customers => 'No customers';

  @override
  String get no_cities_found => 'No cities found';

  @override
  String get no_invoices_found => 'No invoices found';

  @override
  String get close => 'Close';

  @override
  String get coming_soon => 'Coming soon';

  @override
  String get customers => 'Customers';

  @override
  String get default_price => 'Default price';

  @override
  String get purchase_price => 'Purchase price';

  @override
  String get delete_product => 'Delete product?';

  @override
  String get err_blank_value => 'The value can\'t be blank';

  @override
  String get err_invalid_decimal_value => 'The value must be decimal';

  @override
  String get err_value_too_big => 'The value is too big';

  @override
  String get err_invalid_integer_value => 'The value must be an integer';

  @override
  String get err_invalid_value => 'The value is invalid';

  @override
  String get err_negative_value => 'The value can\'t be negative';

  @override
  String get err_not_enough_stock => 'Not enough stock available';

  @override
  String get err_product_name_taken => 'This name is already taken';

  @override
  String get err_value_required => 'A value is required';

  @override
  String get invoices => 'Invoices';

  @override
  String get customer => 'Customer';

  @override
  String current_product_stock(int stock) {
    final intl.NumberFormat stockNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String stockString = stockNumberFormat.format(stock);

    return 'Current product stock: $stockString';
  }

  @override
  String get date => 'Date';

  @override
  String get no_customers_found => 'No customers found';

  @override
  String get edit_product => 'Edit product';

  @override
  String get name => 'Name';

  @override
  String get product => 'Product';

  @override
  String get product_created => 'Product created';

  @override
  String get customer_created => 'Customer created';

  @override
  String get product_edited => 'Product edited';

  @override
  String get product_deleted => 'Product deleted';

  @override
  String get customer_deleted => 'Customer deleted';

  @override
  String get no_invoice_products => 'No invoice products';

  @override
  String get products => 'Products';

  @override
  String get no_date_selected => 'No date selected';

  @override
  String get save => 'Save';

  @override
  String get settings => 'Settings';

  @override
  String get stock => 'Stock';

  @override
  String get this_action_cannot_be_undone => 'This action can\'t be undone.';
}
