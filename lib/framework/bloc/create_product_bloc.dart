import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/input.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/string_validator.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/main.dart';

part 'create_product_bloc.freezed.dart';

/// Event related
sealed class CreateProductEvent {
  const CreateProductEvent();
}

final class NameChanged extends CreateProductEvent {
  final String name;
  const NameChanged(this.name);
}

final class DefaultPriceChanged extends CreateProductEvent {
  final String defaultPrice;
  const DefaultPriceChanged(this.defaultPrice);
}

final class StockChanged extends CreateProductEvent {
  final String stock;
  const StockChanged(this.stock);
}

final class Submitted extends CreateProductEvent {}

/// State related
enum CreateProductStatus { initial, loading, success }

@freezed
abstract class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    @Default(CreateProductStatus.initial) CreateProductStatus status,
    required Input nameInput,
    required Input defaultPriceInput,
    required Input stockInput,
  }) = _CreateProductState;

  const CreateProductState._();

  // Computed properties.
  bool get isValid => [
    nameInput.errors.isEmpty,
    defaultPriceInput.errors.isEmpty,
    stockInput.errors.isEmpty,
    status != CreateProductStatus.loading,
  ].every((el) => el);
}

/// Bloc related
class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final _createProductUseCase = getIt.get<CreateProductUseCase>();
  final _searchProductUseCase = getIt.get<SearchProductUseCase>();

  final Currency _currency;
  final _debouncer = Debouncer();

  CreateProductBloc(this._currency)
    : super(
        CreateProductState(
          nameInput: Input(StringValidator(isRequired: true)),
          defaultPriceInput: Input(CurrencyValidator(_currency)),
          stockInput: Input(IntValidator()),
        ),
      ) {
    on<NameChanged>(_onNameChanged);
    on<DefaultPriceChanged>(_onDefaultPriceChanged);
    on<StockChanged>(_onStockChanged);
    on<Submitted>(_onSubmitted);
  }

  Future<void> _onNameChanged(
    NameChanged event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CreateProductStatus.loading,
        nameInput: state.nameInput.copyWith(value: event.name),
      ),
    );

    _debouncer.debounce(
      () async => _searchProductUseCase.exec(name: event.name.trim()),
    );

    await _debouncer.completer.future.then((result) {
      if (result != null) {
        emit(
          state.copyWith(
            nameInput: state.nameInput.copyWith(
              errors: state.nameInput.errors
                ..add(CustomStateError.productNameTaken),
            ),
          ),
        );
      }
    });

    emit(state.copyWith(status: CreateProductStatus.initial));
  }

  void _onDefaultPriceChanged(
    DefaultPriceChanged event,
    Emitter<CreateProductState> emit,
  ) {
    emit(
      state.copyWith(
        defaultPriceInput: state.defaultPriceInput.copyWith(
          value: event.defaultPrice,
        ),
      ),
    );
  }

  void _onStockChanged(StockChanged event, Emitter<CreateProductState> emit) {
    emit(
      state.copyWith(stockInput: state.stockInput.copyWith(value: event.stock)),
    );
  }

  Future<void> _onSubmitted(
    Submitted event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(state.copyWith(status: CreateProductStatus.loading));

    await _createProductUseCase.exec(
      name: state.nameInput.value,
      defaultPrice: _currency.tryParse(state.defaultPriceInput.value),
      stock: int.tryParse(state.stockInput.value),
    );
    emit(state.copyWith(status: CreateProductStatus.success));
  }
}
