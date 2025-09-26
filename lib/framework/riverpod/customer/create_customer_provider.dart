import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/app/dto/create_customer_request.dart';
import 'package:project_shelf_v3/app/use_case/customer/create_customer_use_case.dart';
import 'package:project_shelf_v3/main.dart';

part 'create_customer_provider.freezed.dart';

/// State related
enum CreateCustomerStatus { INITIAL, LOADING, SUCCESS }

@freezed
abstract class CreateCustomerState with _$CreateCustomerState {
  const factory CreateCustomerState({
    @Default(CreateCustomerStatus.INITIAL) CreateCustomerStatus status,
    required Input nameInput,
    required Input businessNameInput,
    required Input<CityDto> cityInput,
    required Input addressInput,
    required Input phoneNumberInput,
  }) = _CreateCustomerState;

  const CreateCustomerState._();

  // Computed properties
  bool get isValid => <bool>[
    nameInput.errors.isEmpty,
    businessNameInput.errors.isEmpty,
    cityInput.errors.isEmpty,
    addressInput.errors.isEmpty,
    phoneNumberInput.errors.isEmpty,
    status == CreateCustomerStatus.INITIAL,
  ].every((el) => el);
}

/// Provider related
class CreateCustomerNotifier extends Notifier<CreateCustomerState> {
  final _createCustomerUseCase = getIt.get<CreateCustomerUseCase>();

  @override
  CreateCustomerState build() {
    return CreateCustomerState(
      nameInput: Input(validationRules: {IsRequiredRule()}),
      businessNameInput: Input(),
      cityInput: Input<CityDto>(validationRules: {IsRequiredRule()}),
      addressInput: Input(),
      phoneNumberInput: Input(),
    );
  }

  void updateName(String value) {
    state = state.copyWith(nameInput: state.nameInput.copyWith(value: value));
  }

  void updateBusinessNameInput(String value) {
    state = state.copyWith(
      businessNameInput: state.businessNameInput.copyWith(value: value),
    );
  }

  void updateCityInput(CityDto? value) {
    state = state.copyWith(cityInput: state.cityInput.copyWith(value: value));
  }

  void updateAddressInput(String value) {
    state = state.copyWith(
      addressInput: state.addressInput.copyWith(value: value),
    );
  }

  void updatePhoneNumberInput(String value) {
    state = state.copyWith(
      phoneNumberInput: state.phoneNumberInput.copyWith(value: value),
    );
  }

  Future<void> create() async {
    assert(state.isValid);

    state = state.copyWith(status: CreateCustomerStatus.LOADING);

    await _createCustomerUseCase.exec(
      CreateCustomerRequest(
        name: state.nameInput.value,
        cityId: state.cityInput.value!.id,
        address: state.addressInput.value.nullIfEmpty,
        phoneNumber: state.phoneNumberInput.value.nullIfEmpty,
      ),
    );

    state = state.copyWith(status: CreateCustomerStatus.SUCCESS);
  }
}

final createCustomerProvider = NotifierProvider.autoDispose(
  CreateCustomerNotifier.new,
);
