import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.state);

  /// Initialize the cubit
  Future<void> init();
}
