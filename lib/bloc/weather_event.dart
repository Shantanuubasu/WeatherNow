part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];

  get position => null;
}

class FetchWeather extends WeatherEvent{
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}

