import 'package:dog_api_bl/bloc/dogs_bloc.dart';
import 'package:dog_api_bl/models/dogs_model.dart';
import 'package:dog_api_bl/repositories/get_dogs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogsBloc(repository: GetDogsRepository()),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<DogsBloc>(context).add(GetDogsEvent());
            },
            icon: const Icon(Icons.search)),
      ),
      body: BlocConsumer<DogsBloc, DogsState>(
        listener: (context, state) {
          if (state is DogsError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.errorText),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DogsSuccess) {
            return Image.network(state.model.message ?? '');
          } else if (state is DogsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
