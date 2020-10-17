import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resoblocpattern/blocs/settings_bloc.dart';
import 'package:resoblocpattern/blocs/theme_bloc.dart';
import './blocs/blocs.dart';
import './repositories/repositories.dart';
import 'package:resoblocpattern/simple_bloc_observer.dart';
import 'package:http/http.dart' as http;
// import 'models/models.dart' as model;
import './widgets/weather.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

// we need to create our WeatherRepository and inject it into our App
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      BlocProvider<SettingsBloc>(create: (context) => SettingsBloc())
    ],
    child: App(
      weatherRepository: weatherRepository,
    ),
  ));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themState) {
      return MaterialApp(
        theme: themState.theme,
        home: BlocProvider(
            create: (_) => WeatherBloc(weatherRepository: weatherRepository),
            child: Weather()),
      );
    });
    // return MaterialApp(
    //   theme: ThemeData.dark(),
    //   home: BlocProvider(
    //       create: (_) => WeatherBloc(weatherRepository: weatherRepository),
    //       child: Weather()),
    // );
  }
}
