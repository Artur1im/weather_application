import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:store_flutter_progect/bloc/weather_bloc.dart';
import 'package:store_flutter_progect/widget/welcom_time.dart';
import 'package:store_flutter_progect/widget/widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'asset/1.png',
          scale: 3,
        );
      case >= 300 && < 400:
        return Image.asset(
          'asset/2.png',
          scale: 3,
        );
      case >= 500 && < 600:
        return Image.asset(
          'asset/3.png',
          scale: 3,
        );
      case >= 600 && < 700:
        return Image.asset(
          'asset/4.png',
          scale: 3,
        );
      case >= 700 && < 800:
        return Image.asset(
          'asset/5.png',
          scale: 3,
        );
      case == 800:
        return Image.asset(
          'asset/6.png',
          scale: 3,
        );
      case > 800 && <= 804:
        return Image.asset(
          'asset/7.png',
          scale: 3,
        );
      default:
        return Image.asset(
          'asset/8.png',
          scale: 3,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 20, 20),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-3, -0.3),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration:
                            const BoxDecoration(color: Colors.orangeAccent),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                      child: Container(
                          decoration:
                              const BoxDecoration(color: Colors.transparent)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📍 ${state.weather.areaName}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            WelcomeTime(),
                            // const Text(
                            //   greeting,
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            Center(
                              child: getWeatherIcon(
                                  state.weather.weatherConditionCode!),
                            ),
                            Center(
                                child: Text(
                              '${state.weather.temperature!.celsius!.round()} °C',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 55),
                            )),
                            Center(
                              child: Text(
                                "  ${state.weather.weatherMain!.toUpperCase()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Text(
                                DateFormat('EEEE dd ·')
                                    .add_jm()
                                    .format(state.weather.date!),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SunWeather(
                                  foto: 'asset/11.png',
                                  text1: 'Sun Rise',
                                  text2: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunrise!),
                                ),
                                SunWeather(
                                  foto: 'asset/12.png',
                                  text1: 'Sun Set',
                                  text2: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunset!),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.5),
                              child: Divider(color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SunWeather(
                                    foto: 'asset/13.png',
                                    text1: 'Temp Max',
                                    text2:
                                        "  ${state.weather.tempMax!.celsius!.round()} °C"),
                                SunWeather(
                                    foto: 'asset/14.png',
                                    text1: 'Temp Min',
                                    text2:
                                        "  ${state.weather.tempMin!.celsius!.round()} °C"),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SunWeather(
                                    foto: 'asset/hend.png',
                                    text1: '   Feel',
                                    text2:
                                        "  ${state.weather.tempFeelsLike!.celsius!.round()} °C"),
                              ],
                            ),
                          ]),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
