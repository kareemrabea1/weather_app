import 'package:weather/model/weather_model.dart';

class WeatherState{}
// عملنا class سميناه wheatherState خلينا كل ال state اللى عندنا ترث منوا علشان هنروح لل cuibt ونحطه جواه علشان يتعامل معاه
class NoWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherState{
  final String errorMassage;

  WeatherFailureState(this.errorMassage);
}