import 'package:flutter/material.dart';
import 'package:music_player/Screens/Home_Screen.dart';

import 'package:music_player/Themes/Theme_Providers.dart';
import 'package:provider/provider.dart';
import 'package:music_player/models/playlist_Providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProviders()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          theme: ThemeData(),
          home: HomeScreen(),
        );
      }),
    );
  }
}
