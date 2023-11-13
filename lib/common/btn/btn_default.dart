// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../color_extension.dart';
import '../text_theme.dart';

enum BtnDefaultLevel {
  primary,
  secondary,
}

class BtnDefault extends StatelessWidget {
  final bool disable;
  final BtnDefaultLevel level;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTapCancel;
  final void Function(bool)? onHighlightChanged;
  final void Function(bool)? onHover;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final bool? enableFeedback;
  final bool excludeFromSemantics;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final void Function(bool)? onFocusChange;
  final bool autofocus;
  final MaterialStatesController? statesController;
  //Ink
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Widget? child;
  final String title;
  const BtnDefault({
    Key? key,
    this.disable = false,
    this.level = BtnDefaultLevel.primary,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.statesController,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    this.color,
    this.decoration,
    this.width,
    this.height,
    this.child,
    this.title = "Button Title",
  }) : super(key: key);

  Decoration buildDecoration(BuildContext ctx) =>
      decoration ??
      BoxDecoration(
        color: buildColor(ctx),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: buildBorderColor(ctx),
        ),
      );

  Color? buildColor(BuildContext ctx) {
    if (color != null) return color;
    switch (level) {
      case BtnDefaultLevel.secondary:
        return Colors.white;

      default:
        return Theme.of(ctx).primaryColor.withOpacity(disable ? 0.5 : 1);
    }
  }

  Color buildBorderColor(BuildContext ctx) {
    switch (level) {
      case BtnDefaultLevel.secondary:
        return Theme.of(ctx).primaryColor.withOpacity(disable ? 0.5 : 1);

      default:
        return Theme.of(ctx).primaryColor.withOpacity(disable ? 0.0 : 1);
    }
  }

  Color buildTextColor() {
    switch (level) {
      case BtnDefaultLevel.secondary:
        return AppColorScheme.kPrimary;

      default:
        return AppColorScheme.inkWhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!disable) {
          onTap?.call();
        }
      },
      onDoubleTap: () {
        if (!disable) {
          onDoubleTap?.call();
        }
      },
      onLongPress: () {
        if (!disable) {
          onLongPress?.call();
        }
      },
      onTapDown: (value) {
        if (!disable) {
          onTapDown?.call(value);
        }
      },
      onTapUp: (value) {
        if (!disable) {
          onTapUp?.call(value);
        }
      },
      onTapCancel: () {
        if (!disable) {
          onTapCancel?.call();
        }
      },
      onHighlightChanged: (value) {
        if (!disable) {
          onHighlightChanged?.call(value);
        }
      },
      onHover: onHover,
      mouseCursor: mouseCursor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      overlayColor: overlayColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      statesController: statesController,
      child: Ink(
        padding: padding,
        color: color,
        decoration: buildDecoration(context),
        width: width ?? double.infinity,
        height: height,
        child: child ??
            Text(
              title,
              style: tStyle.BtnM(
                color: buildTextColor(),
              ),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
