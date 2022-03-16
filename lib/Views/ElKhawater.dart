import 'package:flutter/material.dart';

class ElKhawater extends StatefulWidget {
  const ElKhawater({Key? key}) : super(key: key);

  @override
  State<ElKhawater> createState() => _ElKhawaterState();
}

class _ElKhawaterState extends State<ElKhawater> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[ElKhawaterCard()],
    );
  }
}

class ElKhawaterCard extends StatefulWidget {
  const ElKhawaterCard({Key? key}) : super(key: key);

  @override
  State<ElKhawaterCard> createState() => _ElKhawaterCardState();
}

class _ElKhawaterCardState extends State<ElKhawaterCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.more_vert),


                  onPressed: () {
                    setState(() {});
                  },
                ),
                Text("صفحة 2")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "البقرة:4",
                  style: TextStyle(color: Color(0xFF96dcdc),),
                ),
                Icon(
                  Icons.edit,
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
      ),
    );
  }
}
