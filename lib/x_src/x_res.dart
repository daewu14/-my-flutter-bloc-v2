///
/// createdby Daewu Bintara
/// Monday, 1/4/21
///

import 'my_config.dart';

export 'my_config.dart';
export 'x_r.dart';
export 'app_theme.dart';
export 'app_localizations.dart';
export '../x_routes/routes.dart';

import 'dart:developer';

import 'package:flutter/foundation.dart';

// ignore: non_constant_identifier_names
void debugLog(String TAG, String message) {
  if (kDebugMode) log("$TAG => ${message.toString()}", name: MyConfig.APP_NAME);
}