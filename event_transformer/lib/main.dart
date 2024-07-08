import 'package:event_transformer/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Transformer',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('안녕'),
      ),
      body: Center(
        child: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    '${context.watch<CounterBloc>().state.counter}',
                    style: TextStyle(fontSize: 52.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_rounded,
                          size: 80,
                        ),
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(IncrementCounterEvent());
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline,
                          size: 80,
                        ),
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(DecrementCounterEvent());
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
