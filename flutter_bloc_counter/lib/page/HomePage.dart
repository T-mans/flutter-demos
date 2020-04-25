import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/page/CounterPage.dart';

import '../bloc/CounterBloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 66.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "two",
              child: Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context)
                    .add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "one",
              child: Icon(Icons.navigate_next),
              onPressed: () {
                //鉴于外层使用了一个全局的Provider，我们其实可以直接打开新页面，而无需使用包裹。
                //由于外层BlocProvider作为一个顶层的Context，不会触发close操作，所以bloc也不会被close。
//                Navigator.of(context).push(
//                    MaterialPageRoute(builder: (context) => CounterPage()));

                Navigator.of(context).push(MaterialPageRoute(
//                  //这里使用.value构造函数，bloc应该也使用同一份
//                  builder: (context) =>
//                      BlocProvider<CounterBloc>.value(
//                        value: BlocProvider.of<CounterBloc>(context),
//                        child: CounterPage(),
//                      ),

                //这里使用new构造，但是使用同一个bloc，这样触发了bloc的关闭，前一个页面的订阅也无效了
                //注意这种写法是一个反面的教材，虽然这样写是可以运行的，但是会引起之前订阅bloc页面的失效
                //所以每当你使用BlocProvider的默认构造函数的时候，应该提供一个新的bloc
//                  builder: (context) => BlocProvider<CounterBloc>(
////                    create: (_) => BlocProvider.of<CounterBloc>(context),
////                    child: CounterPage(),
////                  ),

//                  //这里使用new Provider，new Bloc，两个页面毫无关系。
                  builder: (_) =>
                      BlocProvider<CounterBloc>(
                        create: (_) => CounterBloc(),
                        child: CounterPage(),
                      ),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
