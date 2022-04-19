import 'package:flutter/material.dart';
import '../View_Model/create_db.dart';

import '../Models/Favorite.dart';



class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {

  List<Widget> favCardList=[];

  Future<void> readData()
  async {

    var out2=await DBHelper.instance.readFavTable();

    // print(out2);

    List<Favorite> FavList=convertToModel(out2!);

    setState(() {
      favCardList=loaddatatoFavCard(FavList);

    });


  }

  List<Widget> loaddatatoFavCard(List<Favorite> FavList)
  {
    List<Widget> favCardList=[];

    for (int i=0;i<FavList.length;i++)
      {
        favCardList.add(FavCard(data: FavList[i]));
      }

    print(favCardList.length);

    return favCardList;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      readData();
    });

  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: favCardList,
    );
  }
}

class FavCard extends StatefulWidget {

  final Favorite data;

  const FavCard({Key? key,required this.data}) : super(key: key);

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

                Text(widget.data.pageNumber.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.data.surahName.toString(),
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
            Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.0),
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: widget.data.aya.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
