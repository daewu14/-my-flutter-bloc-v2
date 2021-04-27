
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';

import 'x_src/x_res.dart';
import 'blocs/x_exported_bloc.dart';
import 'my_app_observer.dart';

/// createdby Daewu Bintara
/// Wednesday, 2/24/21

ThemeData themeData;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyAppObserver();
  await GetStorage.init();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  var box = GetStorage();
  box.write(MyConfig.APP_VERSION_CODE, packageInfo.buildNumber);
  box.write(MyConfig.APP_VERSION_NAME, packageInfo.version);
  runApp(App());
}

// ignore: must_be_immutable
class App extends StatelessWidget {
  Locale locale;

  @override
  Widget build(BuildContext context) {

      return BlocProvider(
        create: (_) => MainBloc(),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (_, state){

            if (state is MainInitial) {
              themeData = state.theme.currentTheme();
              locale = state.locale;
            }

            if (state is MsChangeTheme) themeData = state.newTheme;

            if (state is MsChangeLang) locale = state.newLocale;

            return MaterialApp(
              theme: themeData.copyWith(
                pageTransitionsTheme: PageTransitionsTheme(
                  builders: <TargetPlatform, PageTransitionsBuilder>{
                    TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                      transitionType: SharedAxisTransitionType.vertical
                    ),
                  },
                )
              ),
              locale: locale,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en', 'US'),
                Locale('id', 'ID'),
              ],
              onGenerateRoute: Pages.generateRoute,
              initialRoute: RouterName.splash,
            );
          },
        ),
      );
  }
}