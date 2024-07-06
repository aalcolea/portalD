import 'package:flutter/material.dart';

class AnimatedPageViewFade extends StatefulWidget {
  final Widget child;

  const AnimatedPageViewFade({Key? key, required this.child}) : super(key: key);

  @override
  _AnimatedPageViewFadeState createState() => _AnimatedPageViewFadeState();
}

class _AnimatedPageViewFadeState extends State<AnimatedPageViewFade>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!);
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation!,
      child: widget.child,
    );
  }
}
