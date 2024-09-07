import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.white),
        title: const Text('Weather App',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()));

          },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state) {
          if(state is NoWeatherState){
            return const NoWeatherBody();
          }else if(state is WeatherLoadedState){
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          }else{
           return const Text("opps there was an error");
          }
        }
      ),
    );
  }
}
