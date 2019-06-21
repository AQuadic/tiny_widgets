import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class VersesContainer extends StatelessWidget {
  /// verses Text color,
  /// Defaults to : const Color(0xFFF64C4C),
  final Color versesColor;

  /// Text given to [TinyContainer],
  /// Required String!
  final String versesText;

  /// Date Text color,
  /// Defaults to : const Color(0xFFF64C4C),
  final Color dateColor;

  /// Text given to [TinyContainer],
  /// Required String!
  final String dateText;

  /// time Text color,
  /// Defaults to : const Color(0xFFF64C4C),
  final Color timeColor;

  /// Text given to [TinyContainer],
  /// Required String!
  final String timeText;

  /// group Text color,
  /// Defaults to : const Color(0xFFF64C4C),
  final Color groupColor;

  /// Text given to [TinyContainer],
  /// Required String!
  final String groupText;

  const VersesContainer({
    Key key,
    this.versesColor = Colors.black,
    this.versesText = "VS",
    this.dateColor = const Color(0xFFFAA5A5),
    @required this.dateText,
    this.timeColor = const Color(0xFFf64c4c),
    @required this.timeText,
    this.groupColor = const Color(0xFFFAA5A5),
    @required this.groupText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TinyContainer(
          maxHeight: 20,
          text: dateText,
          textColor: dateColor,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.transparent,
        ),
        TinyContainer(
          maxHeight: 20,
          text: timeText,
          textColor: timeColor,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.transparent,
        ),
        TinyContainer(
          maxHeight: 20,
          text: versesText,
          textColor: versesColor,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.transparent,
        ),
        TinyContainer(
          maxHeight: 20,
          text: groupText,
          textColor: groupColor,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
