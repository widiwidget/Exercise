import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer(
      {Key? key,
      this.size,
      this.child,
      required this.onTap,
      this.borderColor,
      this.backgroundColor, required this.duration})
      : super(key: key);
  final double? size;
  final Widget? child;
  final void Function() onTap;
  final Color? borderColor;
  final Color? backgroundColor;
  final Duration duration;

  @override
  State<CustomAnimatedContainer> createState() => _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(widget.size ?? 36 / 2),
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget.size ?? 36,
        height: widget.size ?? 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size ?? 36 / 2),
            color: widget.backgroundColor ?? Colors.green,
            border: Border.all(
                width: 3, color: widget.borderColor ?? Colors.transparent)),
        child: widget.child ?? const SizedBox.shrink(),
      ),
    );
  }
}
