import 'package:flutter/material.dart';

import '../Models/Note.dart';
import '../View_Model/create_db.dart';


class ElKhawater extends StatefulWidget {



  const ElKhawater({Key? key}) : super(key: key);

  @override
  State<ElKhawater> createState() => _ElKhawaterState();
}

class _ElKhawaterState extends State<ElKhawater> {

  List<Widget> noteCardList=[];

  Future<void> readData()
  async {


    var out2=await DBHelper.instance.readNoteTable();

    // print(out2);

    List<Note> NoteList=convertToModel(out2!);
setState(() {
  noteCardList=loaddatatoNoteCard(NoteList);
});



  }

  List<Widget> loaddatatoNoteCard(List<Note> NoteList)
  {
    List<Widget> noteCardList=[];

    for (int i=0;i<NoteList.length;i++)
    {
      noteCardList.add(ElKhawaterCard(data: NoteList[i]));
    }

    print(noteCardList.length);

    return noteCardList;
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
      children: noteCardList,
    );
  }
}

class ElKhawaterCard extends StatefulWidget {

  final Note data;

  const ElKhawaterCard({Key? key,required this.data}) : super(key: key);

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
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[

                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('تعديل'),
                      ),
                    ),

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
            Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.0),
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: widget.data.note.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
