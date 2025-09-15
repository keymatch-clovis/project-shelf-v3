import 'package:flutter/material.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';

class CustomerListTile extends StatelessWidget {
  final Customer customer;
  final void Function(Customer)? onTap;

  const CustomerListTile({required this.customer, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(customer.name));
  }
}
