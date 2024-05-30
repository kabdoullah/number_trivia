import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/number_trivia_bloc.dart';


class TriviaControls extends StatefulWidget {
  const TriviaControls({super.key});

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  late String inputStr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MaterialButton(
                onPressed: dispatchRandom,
                child: const Text('Get random trivia'),
              ),
            ),
          ]),
      ],
    );
  }

   void dispatchConcrete() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForRandomNumber());
  }
}