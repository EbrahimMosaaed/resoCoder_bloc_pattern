import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadinprogress extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;
  const WeatherSuccess({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherFauilr extends WeatherState {}
