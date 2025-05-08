# flutter_bloc_viewmodel

A extension for [flutter_bloc](https://pub.dev/packages/flutter_bloc), which provides a ViewModel.

---

## ✨ Features

- Provides a `ViewModel` class with an `init` method

---

## 🚀 Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_bloc_viewmodel: ^1.0.0
```

## Usage

Just use `ViewModel` and `ViewModelProvider` classes instead of `Cubit` and `BlocProvider`.
You are now able to override the `ViewModel#init` hook to initialize your `ViewModel`, if you like.

```dart
class MyViewModel extends ViewModel<MyState> {
  MyViewModel() : super(const MyState());

  @override
  Future<void> init() async {
    // your initialization code
  }
}

class MyWidget extends StatelessWidget {

  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MyViewModel>(
      create: (context) => MyViewModel(),
      child: BlocBuilder<MyViewModel, MyState>(
        builder: (context, state) {
          // your widgets
        },
      ),
    );
  }
}

```
