import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tiny_widgets.dart';
import 'tmc_src/team_flag.dart';
import 'tmc_src/verses_container.dart';

class TinyMatchCard extends StatelessWidget {
  final String firstTeam;

  final Widget firstTeamFlag;

  final String secondTeam;

  final Widget secondTeamFlag;

  final String timeText;

  final String dateText;

  final String groupText;

  final VoidCallback onTap;
  
  final VoidCallback onLongTap;

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
    this.onLongTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;

    widget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TinyContainer(
          innerPadding: EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.9,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.3,
          backgroundColor: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TeamFlag(
                text: firstTeam,
                flagWidget: firstTeamFlag,
              ),
              VersesContainer(
                timeText: timeText,
                dateText: dateText,
                groupText: groupText,
              ),
              TeamFlag(
                text: secondTeam,
                flagWidget: secondTeamFlag,
              ),
            ],
          ),
        ),
      ],
    );

    if (onTap != null) {
      widget = InkWell(
        onLongPress: onLongTap,
        onTap: onTap,
        child: widget,
      );
    }
    return widget;
  }
}
