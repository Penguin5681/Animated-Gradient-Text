/// A library for creating animated gradient text.
library animated_gradient_text;

import 'package:flutter/material.dart';

/// A widget that displays text with an animated gradient effect.
class AnimatedGradientText extends StatefulWidget {
  /// The text to display.
  final String text;

  /// The colors to use in the gradient.
  final List<Color> colors;

  /// The duration of the animation in seconds.
  final double animationDuration;

  /// Whether to show a border around the text.
  final bool showBorder;

  /// The style to use for the text.
  final TextStyle? textStyle;

  /// The padding to use for the border.
  final double borderPadding;

  /// Creates an [AnimatedGradientText] widget.
  const AnimatedGradientText({
    super.key,
    required this.text,
    this.colors = const [
      Color(0xFF40FFAA),
      Color(0xFF4079FF),
      Color(0xFF40FFAA),
      Color(0xFF4079FF),
      Color(0xFF40FFAA)
    ],
    this.animationDuration = 8,
    this.showBorder = false,
    this.textStyle,
    this.borderPadding = 4.0,
  });

  @override
  State<AnimatedGradientText> createState() => _AnimatedGradientTextState();
}

/// The state for the [AnimatedGradientText] widget.
class _AnimatedGradientTextState extends State<AnimatedGradientText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.animationDuration.toInt()),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (widget.showBorder)
              CustomPaint(
                size: _calculateTextSize(widget.text, widget.textStyle),
                painter: GradientBorderPainter(
                  _controller,
                  widget.colors,
                  widget.borderPadding,
                ),
              ),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                final stops = List.generate(widget.colors.length,
                    (index) => index / (widget.colors.length - 1));
                return LinearGradient(
                  colors: widget.colors,
                  stops: stops,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientTranslation(_controller.value * 2 - 1),
                ).createShader(bounds);
              },
              child: Text(
                widget.text,
                style: widget.textStyle ??
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Calculates the size of the text with the given [text] and [style].
  Size _calculateTextSize(String text, TextStyle? style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }
}

/// A custom painter for painting a gradient border.
class GradientBorderPainter extends CustomPainter {
  /// The animation to use for the gradient.
  final Animation<double> animation;

  /// The colors to use in the gradient.
  final List<Color> colors;

  /// The padding to use for the border.
  final double borderPadding;

  /// Creates a [GradientBorderPainter] with the given [animation], [colors], and [borderPadding].
  GradientBorderPainter(this.animation, this.colors, this.borderPadding)
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      -borderPadding,
      -borderPadding,
      size.width + 2 * borderPadding,
      size.height + 2 * borderPadding,
    );
    final stops =
        List.generate(colors.length, (index) => index / (colors.length - 1));
    final paint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        stops: stops,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: GradientTranslation(animation.value * 2 - 1),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final borderPath = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(20)));
    canvas.drawPath(borderPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// A custom gradient transform for translating the gradient.
class GradientTranslation extends GradientTransform {
  /// The offset to use for the translation.
  final double offset;

  /// Creates a [GradientTranslation] with the given [offset].
  const GradientTranslation(this.offset);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(offset * bounds.width, 0, 0);
  }
}
