import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/dto/ui/company_info_dto.dart';
import 'package:project_shelf_v3/app/use_case/find_file_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/adjust_logo_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_company_info_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/set_company_info_use_case.dart';
import 'package:project_shelf_v3/main.dart';

part 'edit_company_info_provider.freezed.dart';

// State related
enum EditCompanyInfoStatus { INITIAL, LOADING, SUCCESS }

@freezed
abstract class EditCompanyInfoState with _$EditCompanyInfoState {
  const factory EditCompanyInfoState({
    @Default(EditCompanyInfoStatus.INITIAL) EditCompanyInfoStatus status,
    required CompanyInfoDto companyInfo,
    required Input<Uint8List> logoBytes,
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
  final _adjustLogoUseCase = getIt.get<AdjustLogoUseCase>();
  final _findFileUseCase = getIt.get<FindFileUseCase>();

  @override
  FutureOr<EditCompanyInfoState> build() async {
    final companyInfo = await _getCompanyInfoUseCase.exec().then((it) async {
      final logoBytes = await _findFileUseCase
          .exec(it.logoFileName!)
          .then((it) => it.readAsBytes());

      return CompanyInfoDto(logoBytes: logoBytes);
    });

    return EditCompanyInfoState(
      companyInfo: companyInfo,
      logoBytes: Input(value: companyInfo.logoBytes),
      companyName: Input(),
      companyDocument: Input(),
      companyEmail: Input(),
      companyPhone: Input(),
    );
  }

  Future<void> setLogo() async {
    final value = await future;

    final imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      state = AsyncData(value.copyWith(status: EditCompanyInfoStatus.LOADING));

      final bytes = await picked.readAsBytes();
      final logoBytes = await _adjustLogoUseCase.exec(bytes);

      // TODO: move this from here.
      await File(picked.path).delete();

      state = AsyncData(
        value.copyWith(
          status: EditCompanyInfoStatus.INITIAL,
          logoBytes: value.logoBytes.copyWith(value: logoBytes),
        ),
      );
    }
  }

  Future<void> save() async {
    final value = await future;

    state = AsyncData(value.copyWith(status: EditCompanyInfoStatus.LOADING));

    await _setCompanyInfoUseCase.exec(logoBytes: );
  }
}

final editCompanyInfoProvider = AsyncNotifierProvider(
  EditCompanyInfoNotifier.new,
);
