import 'package:bloc_git/logic/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/counter_cubit/counter_state.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.color});
  final Color color;
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              child: const Text("Increment"),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              child: const Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
