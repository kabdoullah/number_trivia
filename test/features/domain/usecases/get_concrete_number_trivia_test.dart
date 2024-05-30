import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

/* class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {} */

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: "text", number: 1);

  test("should get trivia for the number from repository", () async {
    // arrange
    //Implémentation "à la volée" du Repository à l'aide du package Mockito.
      // Lorsque getConcreteNumberTrivia est appelé avec n'importe quel argument, répondez toujours avec
      // le "côté" droit de Soit contenant un objet de test NumberTrivia.
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    // act
    final result = await usecase(Params(number: tNumber));
    // assert
    //UseCase doit simplement renvoyer tout ce qui a été renvoyé du référentiel
    expect(result, Right(tNumberTrivia));
    //Vérifier que la méthode a été appelée sur le Repository
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    //Seule la méthode ci-dessus doit être appelée et rien de plus.
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
