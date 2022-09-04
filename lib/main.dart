import 'package:brot_netflix_app/blocs/downloads/downloads_bloc.dart';
import 'package:brot_netflix_app/core/colours.dart';
import 'package:brot_netflix_app/domain/core/di/injectable.dart';
import 'package:brot_netflix_app/presentation/main_page/screen_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (ctx) => getIt<DownloadsBloc>())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors
                    .transparent), //added this while doing new&hot because the appbar showed up as blue
            scaffoldBackgroundColor: backgroundColour,
            primarySwatch: Colors.blue,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white)),
          ),
          home: ScreenMainPage()),
    );
  }
}
