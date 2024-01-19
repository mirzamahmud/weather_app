import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/screens/home/inner_widget/home_icon_widget.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(40, 1.5 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300, width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300, width: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.5),
                child: Container(
                  height: 300, width: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFAB40)
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),

              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return state is WeatherSuccess ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "📍 ${state.weather.areaName}",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Good Morning",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),
                          ),
                          HomeIconWidget(weatherCode: state.weather.weatherConditionCode ?? 0),
                          Center(
                            child: Text(
                              "${state.weather.temperature!.celsius!.round()}°C",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain.toString().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Center(
                            child: Text(
                              DateFormat("EEEE dd • ").add_jm().format(state.weather.date!),
                              //"Firday 19 • 01:06pm",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // sunrise
                              Row(
                                children: [
                                  Image.asset("assets/images/11.png", scale: 10),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sunrise",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                                
                              // sunset
                              Row(
                                children: [
                                  Image.asset("assets/images/12.png", scale: 10),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sunset",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunset!),
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                                    
                            const Padding(
                              padding: EdgeInsetsDirectional.symmetric(vertical: 12),
                              child: Divider(color: Colors.white10, height: 1),
                            ),
                                
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // max temp
                                Row(
                                  children: [
                                    Image.asset("assets/images/13.png", scale: 10),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Temp Max",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round()}°C",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                
                                // min temp
                                Row(
                                  children: [
                                    Image.asset("assets/images/14.png", scale: 10),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Temp Min",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "${state.weather.tempMin!.celsius!.round()}°C",
                                          style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ) : Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}