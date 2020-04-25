import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/CounterBloc.dart';

class CounterPage extends StatelessWidget {
  CounterPage() {
    print('进入了 CounterPage');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
//    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

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
                BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "three",
              child: Icon(Icons.remove),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}
