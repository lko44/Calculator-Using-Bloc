import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:semester2_aplication/Bloc/Calculator/calculator_bloc.dart';
import 'package:semester2_aplication/Bloc/Calculator/calculator_event.dart';
import 'package:semester2_aplication/Bloc/Calculator/calculator_state.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final aController = TextEditingController();
  final bController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: Builder( // 🔥 THIS IS THE FIX
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Calculator Page')),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildInputField(aController, 'Input angka 1'),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildInputField(bController, 'Input angka 2'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOperationButton('+', () {
                        context.read<CalculatorBloc>().add(
                          AddEvent(
                            _parseInput(aController),
                            _parseInput(bController),
                          ),
                        );
                      }),
                      _buildOperationButton('-', () {
                        context.read<CalculatorBloc>().add(
                          SubtractEvent(
                            _parseInput(aController),
                            _parseInput(bController),
                          ),
                        );
                      }),
                      _buildOperationButton('*', () {
                        context.read<CalculatorBloc>().add(
                          MultiplyEvent(
                            _parseInput(aController),
                            _parseInput(bController),
                          ),
                        );
                      }),
                      _buildOperationButton('/', () {
                        context.read<CalculatorBloc>().add(
                          DivideEvent(
                            _parseInput(aController),
                            _parseInput(bController),
                          ),
                        );
                      }),
                    ],
                  ),

                  const SizedBox(height: 20),

                  BlocBuilder<CalculatorBloc, CalculatorState>(
                    builder: (context, state) {
                      return Text(
                        'HASIL: ${state.result}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        aController.clear();
                        bController.clear();
                        context.read<CalculatorBloc>().add(
                          AddEvent(0, 0),
                        );
                      },
                      child: const Text('Reset'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    aController.dispose();
    bController.dispose();
    super.dispose();
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildOperationButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  double _parseInput(TextEditingController controller) {
    return double.tryParse(controller.text) ?? 0;
  }
}
