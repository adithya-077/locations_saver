import 'package:flutter/material.dart';
import 'package:flutter_application_gg/providers/locationProvider.dart';
import 'package:flutter_application_gg/screens/add_location.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './screens/location_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme:
              GoogleFonts.bebasNeueTextTheme(Theme.of(context).textTheme),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 77, 12, 12)),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              tertiary: const Color.fromARGB(255, 51, 51, 51),
              primary: const Color.fromARGB(255, 187, 51, 74),
              secondary: const Color.fromARGB(255, 216, 215, 215)),
        ),
        home: const LocationListPage(),
        routes: {
          AddLocations.routname: (cnt) => const AddLocations(),
        },
      ),
    );
  }
}
