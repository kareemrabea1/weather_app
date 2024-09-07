import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl =
      'http://api.weatherapi.com/v1'; //عملنا متغير للمسار علشان لو اتغير منقعدشي نغير فكلوا لأ احنا هنغير هنا بس وهو هيسمع فكلوا
  final String apiKe =
      '03de0626a4eb4e7193d110931240807'; //هنا برضوا نفس الكلام ف ال apiKey
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    //بنعمل response
    //عملنا متغير ب اسم ال cityName علشان اسم الدوله متغيره ع حسب اليوزر مايعوز ورجعنا بصينا ال cityName فى ال path بتاع الريكوست
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKe&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(
          response.data); //علشان اجيب البيانات بتاعتى من ال json
      return weatherModel;
    } on DioException catch (e) {
      //on DioExpetion دى علشان بترد عليا لو الرسبونس كان باد ف هتجحبلى نوع الerro
      final String erroMessage=e.response?.data['error']['message']??'opps there was an error,..try later!';
      throw Exception(erroMessage);
    }catch(e){
      log(e.toString());
      throw Exception('opps there was an error,..try later!');
    }
  }
}
