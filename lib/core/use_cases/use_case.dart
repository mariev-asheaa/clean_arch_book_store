import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<T,Param>{
  Future<Either<Failure,T>>call(Param param);
}
//use case determine a function or action user can do within the app