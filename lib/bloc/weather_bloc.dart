import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import '../data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async{
      // TODO: implement event handler
      emit(WeatherLoading());
      try{
        WeatherFactory wf= WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather= await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude,
        );
        print(weather);
        emit(WeatherSuccess(weather));
      }
      catch(e){
        emit(WeatherFailure());
      }
    });
  }
}
