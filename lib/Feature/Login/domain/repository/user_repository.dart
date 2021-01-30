import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, User>> getUser(String email, String password);
  Future<Either<Failure, User>> setUser(
      String email, String password, String name, String lastName);
}
