import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';

// enum CounterEvent { increment, decrement }

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);

//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:

//         yield state + 1;
//         break;
//       case CounterEvent.decrement:
//         yield state - 1;
//         break;
//     }
//   }

//   @override
//   void onEvent(CounterEvent event) {
//     print(event);
//     super.onEvent(event);
//   }
//     @override
//   void onChange(Change<int> change) {
//     print(change);
//     super.onChange(change);
//   }

//   @override
//   void onTransition(Transition<CounterEvent, int> transition) {
//     print(transition);
//     super.onTransition(transition);
//   }
//     @override
//   void onError(Object error, StackTrace stackTrace) {
//     print('$error, $stackTrace');
//     super.onError(error, stackTrace);
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, int>(
          // cubit: bloc,
          builder: (context, state) {
        return Center(child: Text(state.toString()));
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.add(CounterEvent.increment);
              // print(bloc.state.toString());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.add(CounterEvent.decrement);
              // print(bloc.state.toString());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   bloc.close();
  //   super.dispose();
  // }
}
