import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[FavCard()],
    );
  }
}

class FavCard extends StatefulWidget {
  const FavCard({Key? key}) : super(key: key);

  @override
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
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
                // IconButton(
                //   icon: const Icon(Icons.more_vert),
                //
                //
                //   onPressed: () {
                //     setState(() {});
                //   },
                // ),

                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.delete_forever_rounded),
                        title: Text('حذف'),
                      ),
                    ),
                  ],
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
                  Icons.favorite,
                  color:Color(0xFF96dcdc),
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
