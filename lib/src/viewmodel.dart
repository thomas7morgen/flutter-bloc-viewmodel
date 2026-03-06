import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ViewModelCreate<T> = T Function(BuildContext context);

abstract class ViewModel<State> extends Cubit<State> {
  ViewModel(super.initialState);

  @protected
  bool safeEmit(State newState) {
    if (isClosed) return false;
    super.emit(newState);
    return true;
  }

  @override
  void emit(State state) {
    safeEmit(state);
  }

  Future<void> init() async {
    // optional hook
  }
}

class ViewModelProvider<T extends ViewModel<Object?>> extends BlocProvider<T> {
  ViewModelProvider({
    required ViewModelCreate<T> create,
    super.key,
    super.child,
    super.lazy,
  }) : super(create: (BuildContext context) => create(context)..init());
}
