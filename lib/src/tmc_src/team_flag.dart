import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class TeamFlag extends StatelessWidget {
  /// MainAxisAlignment of [TeamFlag],
  /// Defaults to: MainAxisAlignment.center.
  final MainAxisAlignment alignment;

  /// Flag background Color, given to [TinyContainer],
  /// Defaults to: Colors.transparent.
  final Color flagBackgroundColor;

  /// Flag Widget, as it may be network or asset or even cachedNetworkImage,
  /// we can make sure how you gonna use it. so it's only a Widget,
  /// Required Widget!.
  final Widget flagWidget;

  /// Flag Border, if non-null, given to [TinyContainer], Can accept Null,
  /// Defaults to Border.all(color: Colors.white, width: 2).
  final BoxBorder boxBorder;

  /// max Width for the flag, given to [TinyContainer],
  /// Defaults to : 70,
  final double maxWidth;

  /// Text given to [TinyContainer],
  /// Required String!
  final String text;

  /// string MaxHeight,
  /// Defaults to : 30,
  final double textMaxHeight;

  /// text FontWeight,
  /// Defaults to : FontWeight.bold.
  final FontWeight textFontWeight;

  /// text FontSize,
  /// Defaults to : 30,
  final double textFontSize;

  /// Text background color,
  /// Defaults to : Colors.transparent,
  final Color textBackgroundColor;

  /// Text background color,
  /// Defaults to : const Color(0xFFF64C4C),
  final Color textColor;

  const TeamFlag({
    Key key,
    this.alignment = MainAxisAlignment.center,
    this.flagBackgroundColor = Colors.transparent,
    @required this.flagWidget,
    this.boxBorder,
    this.maxWidth = 70,
    @required this.text,
    this.textMaxHeight = 30,
    this.textFontWeight = FontWeight.bold,
    this.textFontSize = 18,
    this.textBackgroundColor = Colors.transparent,
    this.textColor = const Color(0xFFF64C4C),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: alignment,
      children: <Widget>[
        TinyContainer(
          backgroundColor: flagBackgroundColor,
          maxWidth: maxWidth,
          border: boxBorder ?? Border.all(color: Colors.white, width: 2),
          child: flagWidget,
        ),
        TinyContainer(
          textColor: textColor,
          maxWidth: maxWidth,
          maxHeight: textMaxHeight,
          text: text,
          fontWeight: textFontWeight,
          fontSize: textFontSize,
          backgroundColor: textBackgroundColor,
        ),
      ],
    );
  }
}
