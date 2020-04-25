import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/page/HomePage.dart';

import 'bloc/CounterBloc.dart';

///全局的BlocDelegate
class AppBlocDelegate extends BlocDelegate {
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(
        "Global onError:bloc = $bloc error = $error stacktrace = $stacktrace");
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('Global onEvent:bloc = $bloc event = $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Global bloc = $bloc transition = $transition');
  }
}

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
////  //写法一：问题是在于，由于BlocProvider是依赖WidgetTree的，那么作为Homepage的tree的顶端，无法传递到通过路由打开的新页面
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      home: BlocProvider<CounterBloc>(
//        create: (context) => CounterBloc(),
//        child: HomePage(),
//      ),
//    );
//  }

  //写法二：对比写法一，提高了BlocProvider层级在MaterialApp上面，从而该BlocProvider成为了一个全局的Provider
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
