import 'package:flutter/material.dart';

class ElFasel extends StatefulWidget {
  const ElFasel({Key? key}) : super(key: key);

  @override
  State<ElFasel> createState() => _ElFaselState();
}

class _ElFaselState extends State<ElFasel> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[ElFaselCard()],
    );
  }
}

class ElFaselCard extends StatefulWidget {
  const ElFaselCard({Key? key}) : super(key: key);

  @override
  State<ElFaselCard> createState() => _ElFaselCardState();
}

class _ElFaselCardState extends State<ElFaselCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text("صفحة 2")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "البقرة:4",
                style: TextStyle(color: Color(0xFF96dcdc)),
              ),
              Icon(
                Icons.radio_button_checked,
                color: Color(0xFF96dcdc),
                size: 15,
              ),
            ],
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("و اللذين يؤمنون بما انزل اليك"),
        ],
      ),
    );

  }
}
