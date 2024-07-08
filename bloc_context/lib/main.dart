import 'package:bloc_context/counter/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc Context',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Center(
        child: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}',
                  style: const TextStyle(fontSize: 56),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Text('Increment'),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
