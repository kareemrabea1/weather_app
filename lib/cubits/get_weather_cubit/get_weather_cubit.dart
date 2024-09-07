import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/weather_services.dart';

import '../../views/search_view.dart';

class GetWeatherCubit extends Cubit<WeatherState>{//كده خاينا ال cuibt يتعامل مع ال state==>
  // انشأنا class اسموا GitWeatherCuibt وخلناه يرث من ال claas اللى اسموا cuibt (اللى احنا اصلا نزلين ال packdeg علشان نرث منها ونخلى ال class بتاعنا من النوع cuibt

  GetWeatherCubit() : super(NoWeatherState());// دى ال intiealState ودى الاستيت المبدئيه اللى بتتعرض ف اول الابلكيشن مافيش بيانات لسه
  WeatherModel? weatherModel;

  getWeather({required String cityName})async{
   try {
      weatherModel=await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
     emit(WeatherLoadedState(weatherModel!));//معناها ابعت وقوله ان البيانات اتحملت

   }  catch (e) {
     emit(WeatherFailureState(
       e.toString(),
     ));// معناها ابعت قوله ان فى excption حصل
   }

  }
}