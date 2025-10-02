import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';

class CustomerListTile extends StatelessWidget {
  final CustomerDto dto;
  final void Function(CustomerDto)? onTap;

  const CustomerListTile({required this.dto, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap != null ? () => onTap!(dto) : null,
      title: Text(dto.name),
    );
  }
}
