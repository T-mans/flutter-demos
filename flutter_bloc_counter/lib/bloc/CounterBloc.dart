import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }


  //以下方法可以hook当前bloc的流程性操作
  @override
  void onError(Object error, StackTrace stacktrace) {
    print("Local onError: error = $error stacktrace = $stacktrace");
  }

  @override
  void onEvent(CounterEvent event) {
    print('Local onEvent: event = $event');
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print('Local transition = $transition');
  }
}

enum CounterEvent {
  increment,
  decrement,
}
