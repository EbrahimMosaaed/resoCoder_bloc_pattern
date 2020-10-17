import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:resoblocpattern/blocs/blocs.dart';
import 'package:resoblocpattern/models/weather.dart';
import 'package:resoblocpattern/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  // @override
  // Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
  //   if (event is WeatherRequested) {
  //     yield WeatherLoadinprogress();

  //     try {
  //       final Weather weather = await weatherRepository.getWeather(event.city);
  //       yield WeatherSuccess(weather: weather);
  //     } catch (_) {
  //       yield WeatherFauilr();
  //     }
  //   }

  //   if (event is WeatherRefreshRequested) {
  //     try {
  //       final Weather weather = await weatherRepository.getWeather(event.city);
  //       yield WeatherSuccess(weather: weather);
  //     } catch (_) {}
  //   }
  // }

// we can use the upbove code or the blow one

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
      WeatherRequested event) async* {
    yield WeatherLoadinprogress();
    try {
      final Weather weather = await weatherRepository.getWeather(event.city);
      yield WeatherSuccess(weather: weather);
    } catch (_) {
      yield WeatherFauilr();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
      WeatherRefreshRequested event) async* {
    try {
      final Weather weather = await weatherRepository.getWeather(event.city);
      yield WeatherSuccess(weather: weather);
    } catch (_) {}
  }
}
