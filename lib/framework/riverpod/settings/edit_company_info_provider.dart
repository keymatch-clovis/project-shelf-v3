import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/dto/ui/company_info_dto.dart';
import 'package:project_shelf_v3/app/use_case/find_file_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/create_company_logo_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_company_info_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/set_company_info_use_case.dart';
import 'package:project_shelf_v3/domain/entity/company_logo.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/transformers.dart';

part 'edit_company_info_provider.freezed.dart';

// State related
enum EditCompanyInfoStatus { INITIAL, LOADING, SUCCESS }

@freezed
abstract class EditCompanyInfoState with _$EditCompanyInfoState {
  const factory EditCompanyInfoState({
    @Default(EditCompanyInfoStatus.INITIAL) EditCompanyInfoStatus status,
    required CompanyInfoDto companyInfo,
    required Input<CompanyLogo> companyLogo,
    required Input<String> companyName,
    required Input<String> companyDocument,
    required Input<String> companyEmail,
    required Input<String> companyPhone,
  }) = _EditCompanyInfoState;
}

// Provider related
final class EditCompanyInfoNotifier
    extends AsyncNotifier<EditCompanyInfoState> {
  final _getCompanyInfoUseCase = getIt.get<GetCompanyInfoUseCase>();
  final _setCompanyInfoUseCase = getIt.get<SetCompanyInfoUseCase>();
  final _createCompanyLogoUseCase = getIt.get<CreateCompanyLogoUseCase>();

  @override
  FutureOr<EditCompanyInfoState> build() async {
    final CompanyInfoDto companyInfo = await _getCompanyInfoUseCase
        .exec(unit)
        // Unwrap the result.
        // NOTE: We would need to handle the error here, but for not it is fine.
        .then((it) => it.unwrap())
        .map((it) => CompanyInfoDto.fromEntity(it))
        .unwrap();

    return EditCompanyInfoState(
      companyInfo: companyInfo,
      companyLogo: Input(),
      companyName: Input(value: companyInfo.name),
      companyDocument: Input(value: companyInfo.document),
      companyEmail: Input(value: companyInfo.email),
      companyPhone: Input(value: companyInfo.phone),
    );
  }

  Future<void> setLogo() async {
    final value = await future;

    final imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      state = AsyncData(value.copyWith(status: EditCompanyInfoStatus.LOADING));

      final bytes = await picked.readAsBytes();
      final companyLogo = await _createCompanyLogoUseCase.exec(bytes);

      // TODO: move this from here.
      await File(picked.path).delete();

      state = AsyncData(
        value.copyWith(
          status: EditCompanyInfoStatus.INITIAL,
          companyLogo: value.companyLogo.copyWith(value: companyLogo),
        ),
      );
    }
  }

  Future<void> setName(String name) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(companyName: value.companyName.copyWith(value: name)),
    );
  }

  Future<void> setDocument(String document) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        companyDocument: value.companyDocument.copyWith(value: document),
      ),
    );
  }

  Future<void> setEmail(String email) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(companyEmail: value.companyEmail.copyWith(value: email)),
    );
  }

  Future<void> setPhone(String phone) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(companyPhone: value.companyPhone.copyWith(value: phone)),
    );
  }

  Future<void> save() async {
    final value = await future;

    state = AsyncData(value.copyWith(status: EditCompanyInfoStatus.LOADING));

    await _setCompanyInfoUseCase.exec(
      companyLogo: value.companyLogo.value,
      name: value.companyName.value,
      document: value.companyDocument.value,
      email: value.companyEmail.value,
      phone: value.companyPhone.value,
    );

    state = AsyncData(value.copyWith(status: EditCompanyInfoStatus.SUCCESS));
  }
}

final editCompanyInfoProvider = AsyncNotifierProvider.autoDispose(
  EditCompanyInfoNotifier.new,
);
