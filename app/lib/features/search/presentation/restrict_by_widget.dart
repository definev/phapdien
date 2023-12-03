import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

sealed class RestrictSize {
  const factory RestrictSize.bySize(double size) = RestrictBySize;
  const factory RestrictSize.byTarget() = RestrictByTarget;
  const factory RestrictSize.none() = NonRestrict;
}

class RestrictBySize implements RestrictSize {
  const RestrictBySize(this.size);
  final double size;
}

class NonRestrict implements RestrictSize {
  const NonRestrict();
}

class RestrictByTarget implements RestrictSize {
  const RestrictByTarget();
}

class RestrictByWidget extends HookWidget {
  const RestrictByWidget({
    super.key,
    required this.targetKey,
    this.restrictWidth = const RestrictSize.byTarget(),
    this.restrictHeight = const RestrictSize.byTarget(),
    required this.child,
  });

  final GlobalKey targetKey;
  final RestrictSize restrictWidth;
  final RestrictSize restrictHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final targetRenderBox = targetKey.currentContext?.findRenderObject() as RenderBox?;
    final targetSize = targetRenderBox?.size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: switch (restrictWidth) {
          RestrictBySize(:final size) => size,
          RestrictByTarget() => targetSize?.width ?? double.infinity,
          NonRestrict() => double.infinity,
        },
        maxHeight: switch (restrictHeight) {
          RestrictBySize(:final size) => size,
          RestrictByTarget() => targetSize?.height ?? double.infinity,
          NonRestrict() => double.infinity,
        },
      ),
      child: child,
    );
  }
}
