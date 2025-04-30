// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<CounterCubit>().incrementA();
                },
                child: Text("Plus"),
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state is incrementState) {
                    return Text("${state.counterA}");
                  }
                  if (state is decrementState) {
                    return Text(
                      "${state.counterA}",
                      style: TextStyle(color: Colors.red),
                    );
                  } else
                    return Text("${state.counterA}");
                },
              ),
              TextButton(
                onPressed: () {
                  context.read<CounterCubit>().decrementA();
                },
                child: Text("Minus"),
              ),
            ],
          ),
          /////////////////////////////////////////

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<CounterCubit>().incrementB();
                },
                child: Text("Plus"),
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state is incrementState) {
                    return Text("${state.counterB}");
                  }
                  if (state is decrementState) {
                    return Text(
                      "${state.counterB}",
                      style: TextStyle(color: Colors.red),
                    );
                  } else
                    return Text("${state.counterB}");
                },
              ),
              TextButton(
                onPressed: () {
                  context.read<CounterCubit>().decrementB();
                },
                child: Text("Minus"),
              ),
            ],
          ),
          ////////////////////////////////////////////////////////////
        ],
      )),
    );
  }
}
