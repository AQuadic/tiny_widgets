import 'package:flutter/material.dart';
import 'package:tiny_widgets/src/tiny_container.dart';

class TinyContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hello Tiny Container"),
      ),
      body: Column(
        children: <Widget>[
          TinyContainer(
            text: "Yaay a tiny Container",
            backgroundColor: Color(0xFFcb3b3b),
            maxWidth: MediaQuery.of(context).size.width * 0.4,
            textColor: Colors.white,
            fontSize: 16,
          ),
          TinyContainer(
            onTap: () => _showSnackBar(context),
            text: "Did you know?\n you can visit us at TinyProgrammers.ga",
            backgroundColor: Colors.grey,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            textColor: Colors.white,
            fontSize: 16,
          ),
          TinyContainer(
            text: "Next Step on the way",
            backgroundColor: Color(0xFFcb3b3b),
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
            textColor: Colors.purple,
            fontSize: 16,
          ),
        ],
      ),
    );
  }

  _showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Hello Tiny's"),
    ));
  }
}
