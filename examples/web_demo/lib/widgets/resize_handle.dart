import 'package:flutter/material.dart';

class ResizeHandle extends StatefulWidget {
  const ResizeHandle({super.key});

  @override
  State<ResizeHandle> createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<ResizeHandle> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = hovering
        ? theme.colorScheme.onSurface.withOpacity(0.5)
        : Colors.transparent;
    final margin = hovering
        ? const EdgeInsets.symmetric(vertical: 4, horizontal: 8)
        : const EdgeInsets.symmetric(vertical: 4, horizontal: 32);

    return MouseRegion(
      cursor: SystemMouseCursors.resizeUp,
      onEnter: (event) => setState(() {
        hovering = true;
      }),
      onExit: (event) => setState(() {
        hovering = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: margin,
        decoration: BoxDecoration(
          color: hovering ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
