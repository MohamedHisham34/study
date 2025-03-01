// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/cubit/counter_cubit.dart';
import 'package:study/cubit/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                icon: Icon(Icons.add),
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text("${state.counter}");
                },
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
