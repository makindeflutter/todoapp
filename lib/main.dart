import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/controller/cubit/cubit.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()..createDatabase())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo APP',
        theme: lightTheme,
        darkTheme: darkTheme,
        // ignore: prefer_const_constructors
        home: AnimatedSplashScreen(
          splash: Image.asset('asset/images/todo.png'),
          nextScreen: const HomeScreen(),
        ),
      ),
    );
  }
}
