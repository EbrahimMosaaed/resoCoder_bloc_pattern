import 'package:bloc/bloc.dart';


// see all events and states in this application
// The change from one state to another is called a Transition.


class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}