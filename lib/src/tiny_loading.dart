import 'package:flutter/material.dart';

class TinyLoadingPopUp {
  tinyLoading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: TinyLoading(),
          ),
        );
      },
    );
  }
}

class TinyLoading extends StatelessWidget {
  final Color color;
  final Color verColor;
  final int customColor;
  final int verCustomColor;

  TinyLoading(
      {this.color, this.verColor, this.customColor, this.verCustomColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: this.color == null
            ? this.customColor == null
                ? Colors.deepPurpleAccent
                : this.customColor
            : this.color,
        valueColor: AlwaysStoppedAnimation<Color>(
          this.verColor == null
              ? this.verCustomColor == null
                  ? Colors.deepPurple
                  : this.verCustomColor
              : this.verColor,
        ),
      ),
    );
  }
}
