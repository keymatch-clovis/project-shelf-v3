import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_logo_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/save_logo_use_case.dart';
import 'package:project_shelf_v3/main.dart';

part 'company_info_provider.freezed.dart';

// State related
@freezed
abstract class CompanyInfoState with _$CompanyInfoState {
  const factory CompanyInfoState({required Uint8List logoBytes}) =
      _CompanyInfoState;
}

// Provider related
final class CompanyInfoNotifier extends AsyncNotifier<CompanyInfoState> {
  final _getLogoUseCase = getIt.get<GetLogoUseCase>();
  final _saveLogoUseCase = getIt.get<SaveLogoUseCase>();

  @override
  FutureOr<CompanyInfoState> build() async {
    final logoBytes = await _getLogoUseCase.exec();

    return CompanyInfoState(logoBytes: logoBytes);
  }

  Future<void> addImage() async {
    final value = await future;

    final imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final bytes = await picked.readAsBytes();
      await _saveLogoUseCase.exec(logoBytes: bytes);

      // We need to get the logo again, as the business rules might have done
      // something to the loaded image. (ps. It does :p)
      final logoBytes = await _getLogoUseCase.exec();

      state = AsyncData(value.copyWith(logoBytes: logoBytes));

      // TODO: move this from here.
      await File(picked.path).delete();
    }
  }
}

final companyInfoProvider = AsyncNotifierProvider.autoDispose(
  CompanyInfoNotifier.new,
);
