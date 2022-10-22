import 'package:flutter/widgets.dart';

/// {@template text_controller_builder}
/// Exposes a controller (of type [C]) to the child.
/// Used to convert any TextField into a declarative version.
///
///
/// ```dart
/// TextControllerBuilder<MyTextEditingController>(
///   create: () => MyTextEditingController()..doSomethingSpecialOnCreate(),
///   builder: (context, controller) => TextField(
///     controller: controller,
///     onChanged: updateName,
///   ),
/// )
/// ```
/// {@endtemplate}
///
/// I found the implementation useful in a context that prefers using Stateless
/// Widgets over Stateful ones.
class TextControllerBuilder<C extends TextEditingController> extends StatefulWidget {
  /// {@macro text_controller_builder}
  const TextControllerBuilder({
    super.key,
    this.text,
    required this.create,
    required this.builder,
  });

  /// The builder which exposes the controller to the child.
  final Widget Function(BuildContext, C) builder;

  /// If set to `null`, the controller will never update based on this value.
  /// If set to anything not `null`, the controller may change
  final String? text;

  /// The function that creates and returns the controller.
  final C Function() create;

  @override
  TextControllerBuilderState<C> createState() => TextControllerBuilderState<C>();
}

class TextControllerBuilderState<C extends TextEditingController>
    extends State<TextControllerBuilder<C>> {
  late C controller;

  @override
  void initState() {
    controller = widget.create();
    if (widget.text != null) controller.text = widget.text!;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TextControllerBuilder<C> oldWidget) {
    if (oldWidget.text != null && oldWidget.text != widget.text) {
      controller.value = controller.value.copyWith(text: widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, controller);
  }
}