import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required text, required number})
      : super(number: number, text: text);

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      // Le type 'num' peut être à la fois un 'double' et un 'int'
      number: (json['number'] as num).toInt(),
    );
  }
}
