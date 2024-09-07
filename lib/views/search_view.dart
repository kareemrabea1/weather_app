import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Search City',style: TextStyle(color: Colors.white),),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
             var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName: value);

             Navigator.pop(context);
             //هنا بستدعى البيانات الطقس الدوله  اللى يوزر دخلها ف ال search
           },//علشان استقبل قيمه من اليوز  بس ده بيبعتلى القيمه بعد ميخلص مره واحده
           //onChanged: (value){},ده برضوا علبشان استقبل قيمه من اليوز بس دى مختافه عن اللى فوق علشان دى بتبعت التغيرات علطول يعنى كل مايكتب حرف بيتبعت علطول
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 28,horizontal: 16),//بتغير ال hight وال with
              labelText: 'search',
              suffixIcon: Icon(Icons.search), // بتحط الايكون ناحيه اليمين
             // prefixIcon: hint text بتحط الايكون ناحيه الشمال قبل
              hintText: 'Enter City Name',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                )
              ),

            ),

          ),
        ),
      ),
    );
  }
}

