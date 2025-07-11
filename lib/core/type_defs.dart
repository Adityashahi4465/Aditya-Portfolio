import 'package:fpdart/fpdart.dart';

import 'faliure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureVoid = FutureEither<void>;
