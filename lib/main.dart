import 'package:bloc_git/logic/counter_cubit/counter_cubit.dart';
import 'package:bloc_git/presentation/screens/home_screen.dart';
import 'package:bloc_git/presentation/screens/second_screen.dart';
import 'package:bloc_git/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(color: Colors.redAccent),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(color: Colors.blueAccent),
              ),
          '/third': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(color: Colors.greenAccent),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
