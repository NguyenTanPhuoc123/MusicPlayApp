import 'package:flutter/material.dart';
import 'package:music_app/constants/screen_key.dart';
import 'package:music_app/views/screens/authentication/landingpage.dart';
import 'package:music_app/views/screens/authentication/login.dart';

Map<String,Widget Function(BuildContext)> routes = {
  landingPage:(context)=> const LandingPage(),
  loginScreen:(context)=>const LoginScreen()
};