import 'failure.dart';

class ServerFailure implements Failure {
  @override
  String get failureMsg => 'Ooops! Something went wrong...';
}
