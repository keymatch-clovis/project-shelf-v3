import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';

class CustomerListTile extends StatelessWidget {
  final CustomerDto customer;
  final void Function(CustomerDto) onSelect;

  const CustomerListTile(this.customer, {super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    // Trying to follow:
    // https://m3.material.io/blog/building-with-m3-expressive
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: ListTile(
        visualDensity: VisualDensity.compact,
        onTap: () => onSelect(customer),
        title: Text(customer.name),
        subtitle: Text(customer.city.fullName),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
