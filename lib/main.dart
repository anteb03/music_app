import 'package:aplikacija1/login.dart';
import 'package:aplikacija1/splash.dart';
import 'package:aplikacija1/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:aplikacija1/register.dart';
import 'package:aplikacija1/display.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MusicLibrary',
    home: Splash(),
    routes: {
      'splash': (context) => Splash(),
      'login': (context) => Login(),
      'register': (context) => Register(),
      'welcomepage': (context) => WelcomePage(),
      'display': (context) => Display(),
    },
  ));
}
