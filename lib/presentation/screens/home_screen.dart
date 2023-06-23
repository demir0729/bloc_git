import 'package:bloc_git/logic/counter_cubit/counter_cubit.dart';
import 'package:bloc_git/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/counter_cubit/counter_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.color});
  final Color color;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: widget.color),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  state.countValue.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: const SecondScreen(color: Colors.blue),
                    ),
                  ));
                },
                child: const Text('go to second screen'))
          ],
        ),
      ),
    );
  }
}
