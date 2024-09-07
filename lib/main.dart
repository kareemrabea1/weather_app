import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: customMatrailApp(),
    );
  }
}

class customMatrailApp extends StatelessWidget {
  const customMatrailApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
                home: HomeView(),
              );
            },
          ),
        ));
  }
}

MaterialColor getThemeColor(String? condion) {
  if (condion == null) {
    return Colors.blue;
  }
  switch (condion) {
    case "Sunny":
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.lightBlue;
    case "Patchy rain possible":
      return Colors.blue;
    case "Patchy snow possible":
      return Colors.grey;
    case "Patchy sleet possible":
      return Colors.lightBlue;
    case "Patchy freezing drizzle possible":
      return Colors.cyan;
    case "Thundery outbreaks possible":
      return Colors.purple;
    case "Blowing snow":
      return Colors.lightBlue;
    case "Blizzard":
      return Colors.blueGrey;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.lightBlue;
    case "Patchy light drizzle":
    case "Light drizzle":
      return Colors.lightBlue;
    case "Freezing drizzle":
      return Colors.cyan;
    case "Heavy freezing drizzle":
      return Colors.blue;
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
      return Colors.blue;
    case "Heavy rain at times":
    case "Heavy rain":
      return Colors.indigo;
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan;
    case "Light sleet":
    case "Moderate or heavy sleet":
      return Colors.lightBlue;
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
      return Colors.grey;
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.blueGrey;
    case "Ice pellets":
      return Colors.lightBlue;
    case "Light rain shower":
    case "Moderate or heavy rain shower":
      return Colors.blue;
    case "Torrential rain shower":
      return Colors.indigo;
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "Light snow showers":
    case "Moderate or heavy snow showers":
      return Colors.grey;
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "Patchy light rain with thunder":
      return Colors.purple;
    case "Moderate or heavy rain with thunder":
      return Colors.purple;
    case "Patchy light snow with thunder":
      return Colors.grey;
    case "Moderate or heavy snow with thunder":
      return Colors.blueGrey;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
