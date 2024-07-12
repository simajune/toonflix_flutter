import 'package:bloc_hydrated/counter/counter_bloc.dart';
import 'package:bloc_hydrated/theme/theme_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'hydrated_bloc',
              theme: state.appTheme == AppTheme.light
                  ? ThemeData.dark()
                  : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              home: const MainPage());
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hydrated Bloc',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                '${context.watch<CounterBloc>().state.counter}',
                style: const TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<ThemeBloc>().add(ToggleThemeEvent());
                      },
                      icon: const Icon(
                        Icons.brightness_medium_rounded,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(IncrementCounterEvent());
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(DecrementCounterEvent());
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                      onPressed: () {
                        HydratedBloc.storage.clear();
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
