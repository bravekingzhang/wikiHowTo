import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disk_lru_cache/disk_lru_cache.dart';
abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  @override
  // TODO: implement initialState
  get initialState => LoadingState();

  @override
  void onTransition(Transition<BaseEvent, BaseState> transition) {
    super.onTransition(transition);
    print("========onTransition======$transition");
  }
}

abstract class BaseEvent {}

abstract class BaseState {}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {
  int code;
  String msg;

  ErrorState({this.code, this.msg});
}
