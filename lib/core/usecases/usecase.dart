import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failures.dart';

// Les paramètres doivent être placés dans un objet conteneur afin qu'ils puissent être
// inclus dans cette définition de méthode de classe de base abstraite.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Ceci sera utilisé par le code appelant le cas d'utilisation chaque fois que le cas d'utilisation
// n'accepte aucun paramètre.

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
