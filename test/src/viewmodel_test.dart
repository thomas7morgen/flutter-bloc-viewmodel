import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_viewmodel/src/viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

class MyViewModel extends ViewModel<void> {
  bool _wasInitializeCalled = false;

  MyViewModel() : super(null);

  bool get wasInitializeCalled => _wasInitializeCalled;

  @override
  Future<void> init() async {
    _wasInitializeCalled = true;
  }
}

class MyWidget extends StatelessWidget {
  final MyViewModel _myViewModel = MyViewModel();

  MyWidget({super.key});

  MyViewModel get viewModel => _myViewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MyViewModel>(
      create: (context) => _myViewModel,
      child: BlocBuilder<MyViewModel, void>(
        builder: (context, state) {
          return Placeholder();
        },
      ),
    );
  }
}

void main() {
  group('ViewModel', () {
    testWidgets('init is called', (WidgetTester tester) async {
      final widget = MyWidget();

      await tester.pumpWidget(widget);

      expect(widget.viewModel.wasInitializeCalled, true);
    });
    ;
  });
}
