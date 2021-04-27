import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_bloc_v2/repositories/x_exported_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());

  var _memberRepo = MemberRepo();

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is Loading) {
      yield* _loadMember();
    }
  }

  Stream<SplashState> _loadMember() async* {
    final value = await _memberRepo.createData();
    final ress = value.result;

    if (ress.isError) {
      yield SplashInitial();
      return;
    }

    if (!ress.status) {
      yield SplashInitial();
      return;
    }

    yield GoToCounterPage();
    return;

  }

}
