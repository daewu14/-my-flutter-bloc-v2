import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../x_exported_res_util_widget.dart';

part 'main_event.dart';
part 'main_state.dart';
var box = GetStorage();
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial());

  @override
  Stream<MainState> mapEventToState(
      MainEvent event,
      ) async* {

    if (event is MainEventChangeTheme) {
      yield* _changeTheme();
    }

    if (event is MainEventChangeLang) {
      yield* _changeLanguage(event.locale);
    }

  }

  Stream<MainState> _changeTheme() async* {
    yield MainStateLoading();
    AppTheme thmee = AppTheme();
    thmee.togleTheme();
    yield MsChangeTheme(thmee.currentTheme());
  }

  Stream<MainState> _changeLanguage(Locale locale) async* {
    yield MainStateLoading();
    Locale newLocale = AppLocalizations.setLocale(locale);
    yield MsChangeLang(newLocale);
  }
}
