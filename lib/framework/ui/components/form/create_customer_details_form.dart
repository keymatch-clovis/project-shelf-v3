import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/city_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/create_customer_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/custom_state_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/city_list.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

final class CreateCustomerDetailsForm extends ConsumerStatefulWidget {
  const CreateCustomerDetailsForm({super.key});

  @override
  ConsumerState<CreateCustomerDetailsForm> createState() =>
      _CreateCustomerDetailsFormState();
}

final class _CreateCustomerDetailsFormState
    extends ConsumerState<CreateCustomerDetailsForm> {
  final _nameFieldFocus = FocusNode();
  final _businessNameFieldFocus = FocusNode();
  final _addressFieldFocus = FocusNode();
  final _phoneNumberInput = FocusNode();

  final _citySearchController = SearchController();

  @override
  void dispose() {
    super.dispose();

    _nameFieldFocus.dispose();
    _businessNameFieldFocus.dispose();
    _addressFieldFocus.dispose();
    _phoneNumberInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(createCustomerProvider);

    // We need to listen to this provider for it to not autodispose when the
    // search anchor is closed.
    //
    // NOTE: I don't know another way of doing this.
    ref.listen(citySearchProvider, (_, _) {});

    return Padding(
      // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
      padding: EdgeInsetsGeometry.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          CustomTextField(
            isRequired: true,
            label: localizations.name,
            value: state.nameInput.value,
            errors: state.nameInput.errors.parseErrors(context),
            focusNode: _nameFieldFocus,
            onFieldSubmitted: (_) {
              _citySearchController.openView();
            },
            onChanged: ref.read(createCustomerProvider.notifier).updateName,
            onClear: () =>
                ref.read(createCustomerProvider.notifier).updateName(""),
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
          ),
          SearchAnchor(
            viewPadding: EdgeInsets.zero,
            isFullScreen: true,
            textCapitalization: TextCapitalization.characters,
            searchController: _citySearchController,
            textInputAction: TextInputAction.next,
            builder: (_, _) {
              return CustomObjectField<City>(
                label: localizations.city,
                isRequired: true,
                textValue: state.cityInput.value?.name,
                errors: state.cityInput.errors.parseErrors(context),
                onTap: _citySearchController.openView,
              );
            },
            viewBuilder: (_) => Consumer(
              builder: (_, ref, _) {
                return ref
                    .watch(citySearchProvider)
                    .when(
                      data: (it) {
                        return CityList(
                          items: it,
                          onTap: (city) {
                            ref
                                .read(createCustomerProvider.notifier)
                                .updateCityInput(city);

                            _citySearchController.closeView(null);

                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              _businessNameFieldFocus.requestFocus();
                            });
                          },
                        );
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      error: (err, _) {
                        Logger().f(err);
                        throw AssertionError(err);
                      },
                    );
              },
            ),
            suggestionsBuilder: (_, controller) {
              ref
                  .read(citySearchProvider.notifier)
                  .updateQuery(controller.text);

              return const [];
            },
          ),
          CustomTextField(
            label: localizations.business_name,
            value: state.businessNameInput.value,
            errors: state.businessNameInput.errors.parseErrors(context),
            focusNode: _businessNameFieldFocus,
            onFieldSubmitted: (_) => _addressFieldFocus.requestFocus(),
            onChanged: ref
                .read(createCustomerProvider.notifier)
                .updateBusinessNameInput,
            onClear: () => ref
                .read(createCustomerProvider.notifier)
                .updateBusinessNameInput(""),
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            label: localizations.address,
            value: state.addressInput.value,
            errors: state.addressInput.errors.parseErrors(context),
            focusNode: _addressFieldFocus,
            onFieldSubmitted: (_) => _phoneNumberInput.requestFocus(),
            onChanged: ref
                .read(createCustomerProvider.notifier)
                .updateAddressInput,
            onClear: () => ref
                .read(createCustomerProvider.notifier)
                .updateAddressInput(""),
            keyboardType: TextInputType.streetAddress,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            label: localizations.phone_number,
            value: state.phoneNumberInput.value,
            errors: state.phoneNumberInput.errors.parseErrors(context),
            focusNode: _phoneNumberInput,
            onChanged: ref
                .read(createCustomerProvider.notifier)
                .updatePhoneNumberInput,
            onClear: () => ref
                .read(createCustomerProvider.notifier)
                .updatePhoneNumberInput(""),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
