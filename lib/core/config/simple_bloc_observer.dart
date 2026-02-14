import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  final Logger _logger = Logger();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.d('${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.e(
      '${bloc.runtimeType} $error',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.i('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.i('${bloc.runtimeType} $transition');
  }
}
