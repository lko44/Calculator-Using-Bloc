import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semester2_aplication/Bloc/Calculator/calculator_bloc.dart';
import 'package:semester2_aplication/Bloc/Calculator/calculator_event.dart';
import 'package:semester2_aplication/Bloc/Calculator/calculator_state.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator Page')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: aController,
                    decoration: InputDecoration(
                      hintText: "input angka 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: bController,
                    decoration: InputDecoration(
                      hintText: "input angka 2",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CalculatorBloc>().add(AddEvent(a(), b()));
                    },
                    child: Text("+"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CalculatorBloc>().add(
                        SubtractEvent(a(), b()),
                      );
                    },
                    child: Text("-"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CalculatorBloc>().add(
                        MultiplyEvent(a(), b()),
                      );
                    },
                    child: Text("*"),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<CalculatorBloc>().add(DivideEvent(a(), b()));
                    },
                    child: Text("/"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
                  if (state is CalculatorResult) {
                    return Text("HASIL: ${state.result}");
                  }
                  return Text("HASIL:");
                },
              ),
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CalculatorBloc>().add(ResetEvent());
                },
                child: Text("Reset"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
