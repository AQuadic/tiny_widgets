import 'package:flutter/material.dart';

class TinyContainer extends StatelessWidget {
  /// Requires the child to have exactly this width, it's assigned to external [SizedBox].
  /// Defaults to : MediaQuery.of(context).size.width * 0.25.
  final double maxWidth;

  /// Requires the child to have exactly this height, it's assigned to external [SizedBox].
  /// Defaults to : MediaQuery.of(context).size.height * 0.06.
  final double maxHeight;

  /// Minimum allowed width, it's assigned to internal [Container].
  /// Defaults to : MediaQuery.of(context).size.width * 0.15.
  final double width;

  /// Minimum allowed height, it's assigned to internal [Container].
  /// Defaults to : MediaQuery.of(context).size.height * 0.03.
  final double height;

  /// FontSize for [text] if given,
  /// Defaults to : 14.
  final double fontSize;

  /// TextScaleFactor for [Text] if given,
  /// Defaults to : 1.0.
  final double textScaleFactor;

  /// Text given to [Text] widget if child == null.
  /// If Empty String it gets passed to [_fixEmptyText] to return " "
  final String text;

  /// Text given to [Text] widget if child == null.
  /// Defaults to : "Hacen".
  final String fontFamily;

  /// BackgroundColor of [Container],
  /// Defaults to : Color(0xFF6D6DFF).
  final Color backgroundColor;

  /// Color given to [Text] widget if child == null.
  /// Defaults to : Colors.white.
  final Color textColor;

  /// FontWeight given to [Text] widget if child == null.
  /// Defaults to : FontWeight.normal.
  final FontWeight fontWeight;

  /// TextDecoration given to [Text] widget if child == null.
  /// Defaults to : [Null]
  final TextDecoration textDecoration;

  /// If non-null, [TinyContainer] is wrapped in [InkWell].
  /// Defaults to : [Null].
  final VoidCallback onTap;

  /// BoxFit given to [FittedBox] widget if child == null.
  /// Defaults to : BoxFit.scaleDown.
  final BoxFit boxFit;

  /// Child Widget given to the [Container], this makes any [Text] attr useless
  /// Defaults to : [Null].
  final Widget child;

  /// AlignmentGeometry of [Container] child,
  /// Defaults to : Alignment.center.
  final AlignmentGeometry alignment;

  /// This Class can be used as Const as it requires no non-const Attr.
  const TinyContainer({
    Key key,
    this.maxWidth,
    this.maxHeight,
    this.width,
    this.height,
    this.fontSize = 14,
    this.textScaleFactor = 1.0,
    this.text,
    this.fontFamily = "Hacen",
    this.backgroundColor = const Color(0xFF6D6DFF),
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.textDecoration,
    this.onTap,
    this.boxFit = BoxFit.scaleDown,
    this.child,
    this.alignment = Alignment.center,
  })  : assert(child != null || text != null),
        super(key: key);

  /// This function used as Work around of if given [text] is empty, as:
  /// [FittedBox] will complain about [Text] have to width/height to [boxFit].
  _fixEmptyText(String text) {
    if (text.isEmpty) return " ";
    return text;
  }

  @override
  Widget build(BuildContext context) {
    // Child Widget;
    Widget childWidget;

    // We make a check if it's Widget [child] or text
    if (child != null) {
      childWidget = child;
    } else {
      childWidget = FittedBox(
        fit: boxFit,
        child: Text(
          _fixEmptyText(text),
          textScaleFactor: textScaleFactor,
          style: TextStyle(
            // TODO: Let this use Theme Data
            decoration: textDecoration,
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily,
          ),
        ),
      );
    }

    // Our Widget
    Widget finalWidget = SizedBox(
      width: maxWidth ?? MediaQuery.of(context).size.width * 0.25,
      height: maxHeight ?? MediaQuery.of(context).size.height * 0.06,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.15,
        height: height ?? MediaQuery.of(context).size.height * 0.03,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        alignment: alignment,
        child: childWidget,
      ),
    );

    // adding Tab Feature
    if (onTap != null) {
      finalWidget = InkWell(
        onTap: onTap,
        child: finalWidget,
      );
    }

    return finalWidget;
  }
}
