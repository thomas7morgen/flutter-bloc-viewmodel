import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_viewmodel/src/viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

class MyViewModel extends ViewModel<void> {
  bool _wasClicked = false;

  MyViewModel() : super(null);

  bool get wasClicked => _wasClicked;

  @override
  Future<void> init() async {
    _wasClicked = true;
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
  testWidgets('init is called', (WidgetTester tester) async {
    final widget = MyWidget();

    await tester.pumpWidget(widget);

    expect(widget.viewModel.wasClicked, true);
  });
}
