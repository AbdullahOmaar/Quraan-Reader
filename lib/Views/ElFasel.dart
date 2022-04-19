import 'package:flutter/material.dart';
import '../View_Model/create_db.dart';

import '../Models/Bookmark.dart';


class ElFasel extends StatefulWidget {
  const ElFasel({Key? key}) : super(key: key);

  @override
  State<ElFasel> createState() => _ElFaselState();
}

class _ElFaselState extends State<ElFasel> {

  List<Widget> BookmarkCardList=[];

  Future<void> readData()
  async {

    var out2=await DBHelper.instance.readBookmarkTable();

    print(out2);

    List<Bookmark> BookmarkList=convertToModel(out2!);

    setState(() {
      BookmarkCardList=loaddatatoFavCard(BookmarkList);

    });


  }

  List<Widget> loaddatatoFavCard(List<Bookmark> BookmarkList)
  {
    List<Widget> BookmarkCardList=[];

    for (int i=0;i<BookmarkList.length;i++)
    {
      BookmarkCardList.add(ElFaselCard(data: BookmarkList[i]));
    }

    print(BookmarkCardList.length);

    return BookmarkCardList;
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
      children: BookmarkCardList,
    );
  }
}

class ElFaselCard extends StatefulWidget {
  final Bookmark data;

  const ElFaselCard({Key? key,required this.data}) : super(key: key);

  @override
  State<ElFaselCard> createState() => _ElFaselCardState();
}

class _ElFaselCardState extends State<ElFaselCard> {
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

                Text(widget.data.pageNumber.toString())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.data.surahName.toString(),
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
            Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.0),
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: widget.data.aya_text.toString()),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
