
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/x_exported_bloc.dart';
import '../screens/x_exported_screen.dart';

import 'router_name.dart';

/// createdby Daewu Bintara
/// Wednesday, 2/24/21

class Pages {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){

      case RouterName.splash:
        // var arg = settings.arguments as Obje;
        return MaterialPageRoute(
              builder: (_) => BlocProvider(
              create: (_) => SplashBloc()..add(Loading()),
              child: SplashScreen(),
            )
        );
        break;
    }

  }
}