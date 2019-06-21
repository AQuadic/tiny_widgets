import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiny_widgets/tiny_widgets.dart';

class TinyContainerExample extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hello Tiny Container"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TinyContainer(
              outerPadding: EdgeInsets.all(20),
              text: "Yaay a tiny Container",
              backgroundColor: Color(0xFFcb3b3b),
              maxWidth: MediaQuery.of(context).size.width * 0.4,
              textColor: Colors.white,
              fontSize: 16,
            ),
            TinyContainer(
              outerPadding: EdgeInsets.all(20),
              textAlign: TextAlign.center,
              onTap: () => _showSnackBar(context),
              text: "Did you know?\n you can visit us at TinyProgrammers.ga",
              backgroundColor: Colors.grey,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              textColor: Colors.white,
              fontSize: 16,
            ),
            TinyContainer(
              outerPadding: EdgeInsets.all(20),
              child: Image.asset(
                "assets/egypt_flag.png",
                fit: BoxFit.scaleDown,
              ),
              border: Border.all(color: Colors.yellow, width: 3),
              backgroundColor: Colors.blue,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              textColor: Colors.purple,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }

  _showSnackBar(BuildContext context) {
    _key.currentState.showSnackBar(SnackBar(
      content: Text("Hello Tiny's"),
    ));
  }
}
