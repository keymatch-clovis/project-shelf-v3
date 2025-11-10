import 'package:flutter/material.dart';

/// -------------------------
/// Tailwind 3 and 4 measures
/// TODO: Comment why this xd
/// -------------------------
const T_1 = 4.0;
const T_2 = 8.0;
const T_4 = 16.0;
const T_6 = 24.0;
const T_16 = 64.0;
const T_48 = 192.0;
const T_56 = 224.0;

/// -----------------
/// Material measures
/// -----------------
const XS_SPACING_H = EdgeInsets.symmetric(horizontal: T_1);
const XS_SPACING_ALL = EdgeInsets.all(T_1);

const S_SPACING_H = EdgeInsets.symmetric(horizontal: T_2);
const S_SPACING_V = EdgeInsets.symmetric(vertical: T_2);
const S_SPACING_B = EdgeInsets.only(bottom: T_2);
const S_SPACING_ALL = EdgeInsets.all(T_2);

// https://m3.material.io/foundations/layout/applying-layout/compact#5a83ddd7-137f-4657-ba2d-eb08cac065e7
const COMPACT_SPACING_H = EdgeInsets.symmetric(horizontal: T_4);
const COMPACT_SPACING_V = EdgeInsets.symmetric(vertical: T_4);
const COMPACT_SPACING_ALL = EdgeInsets.all(T_4);

// https://m3.material.io/components/dialogs/specs#9a8c226b-19fa-4d6b-894e-e7d5ca9203e8
const MEDIUM_SPACING_H = EdgeInsets.symmetric(horizontal: T_6);
const MEDIUM_SPACING_ALL = EdgeInsets.all(T_6);

// https://m3.material.io/components/app-bars/specs#14978a2b-e102-46df-8103-c0365076be82
const SEARCH_APP_BAR_HEIGHT = T_16;
