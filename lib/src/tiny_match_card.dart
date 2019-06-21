import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TinyMatchCard extends StatelessWidget {
  final String firstTeam;

  final Widget firstTeamFlag;

  final String secondTeam;

  final Widget secondTeamFlag;

  final String timeText;

  final String dateText;

  final String groupText;

  final VoidCallback onTap;

  const TinyMatchCard({
    Key key,
    @required this.firstTeam,
    @required this.firstTeamFlag,
    @required this.secondTeam,
    @required this.secondTeamFlag,
    @required this.timeText,
    @required this.dateText,
    @required this.groupText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (onTap != null) {
      widget = InkWell(
        onTap: onTap,
        child: widget,
      );
    }
    return widget;
  }
}
