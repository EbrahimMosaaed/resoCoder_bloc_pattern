// import 'dart:async';

// import 'package:resoblocpattern/counter_event.dart';

// class CounterBloc {
//   int _counter = 0;

// // this for state to listen to stream output
//   final _counterStateController = StreamController<int>();
//   StreamSink<int> get _inCounter => _counterStateController.sink; // private
//   Stream<int> get counter =>
//       _counterStateController.stream; // public  for all widgets can listen it

// // this for event for ui to input number (event) .... sink will be public here to use for input number(event) from widegts
//   final _counterEventController = StreamController<CounterEvent>();
//   Sink<CounterEvent> get counterEventSink => _counterEventController.sink;
//   CounterBloc() {
//     _counterEventController.stream.listen(_mapEventToSate);
//   }

//   void _mapEventToSate(CounterEvent event) {
//     if (event is IncermentEvent)
//       _counter++;
//     else
//       _counter--;
//       _inCounter.add(_counter);
//   }
// void dispose(){
// _counterStateController.close();
// _counterEventController.close();
// }


// }
