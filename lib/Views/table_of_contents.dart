
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../View_Model/create_db.dart';
import '../Services.dart';
import '../Models/Surah.dart';


void main() {
  runApp(
      const MyApp()
  );
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Table(),
    );
  }
}


class Table extends StatefulWidget {
  const Table({Key? key}) : super(key: key);

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> with SingleTickerProviderStateMixin{
   int  _contentNumber=10;
  final int  _threshold=4;
   bool _loading=false;
   bool _conetntError = false;
   List<dynamic>? _surahs;
  ScrollController? _scrollController;
  TabController? _tabController;

  getSurahs() async {
    _surahs = await DBHelper.instance.readAllSurahs();
  }

  fetchResults(String keyword) async {
    if (keyword.isEmpty)
    {
      _surahs = await DBHelper.instance.readAllSurahs();
    }
    else
    {
      _surahs =await  DBHelper.instance.searchSurahs(keyword);
      // print("----------------");
      // print(_results[0].pageNumber);
      _contentNumber= _surahs!.length;
    }

    setState (()   {
      _surahs=_surahs;
      _contentNumber= _contentNumber;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSurahs();
    // DBHelper.instance.database;


    _scrollController =  ScrollController(initialScrollOffset: 5.0);
    _tabController =  TabController(length:2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:const Color(0xFF94C2B6),
          // title: const Text('الفهرس'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text("الأجزاء", style: TextStyle(color: Colors.black87,  fontWeight: FontWeight.bold)),
              ),
              Tab(
                icon:  Text("السور",style:TextStyle(color: Colors.black87,  fontWeight: FontWeight.bold)),
              ),
            ],
            indicatorColor: const Color(0xFFFF1C7B7B)
          ),
          actions: <Widget> [
            Container(
              child: const Padding(
                padding:  EdgeInsets.all(16),
                child:  Text(
                  "الفهرس  ",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.black),
              //TODO: Navigate to previous page
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        body:  TabBarView(
          children: [
            // Icon(Icons.directions_car),
            // Icon(Icons.directions_transit),
          // controller: _tabController,
          // children: [
            Center(
              child: const Text("الاجزاء"),
            ),
            Column(
              children:
              [
                Container(
              height: 55,
              color:const Color(0xFF94C2B6),
              padding: const EdgeInsets.all(6),
              child:  TextFormField(
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color:  Color(0xFFFF1C7B7B),
                  ),
                  // focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: InputBorder.none,
                  hintText: 'بحث',
                ),
                onChanged: (keywords)  async {

                  await fetchResults(keywords);
                  setState (() {

                    //TODO: Retrieve results
                  });
                },
              ),
                ),

            Expanded(
              child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: _contentNumber,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 4.0,
                    );
                  },


                  itemBuilder:
                      (BuildContext context, int index) {
                    if (index ==
                        _contentNumber -
                    _threshold) {
                      print("Reached end of list");
                      // viewUsers();
                    }
                    if (index == _contentNumber) {
                      if (_conetntError) {
                        return Expanded(
                          // height: 50,
                          // width: 100,
                          child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _loading = true;
                                    _conetntError = false;
                                     print("Error");
                                    // viewUsers();
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                      "Error while loading photos, tap to try again"),
                                ),
                              )),
                        );
                      } else {}
                    }
                    return buildListTile(_surahs![index]);
                  }),
            ),
              ],
            ),

            // Center(
            //   child: Text("It's sunny here"),
            // ),
          ],
        ),
      ),
    );
  }
}

ListTile buildListTile(Surah s) {
  int surahNumber=s.surahNumber!;
  int page = s.surahPage!;
  return ListTile(
    onTap: (){
      print("Tapped");
    },
    leading: Text("$page صفحة",
      style: TextStyle(
        // fontWeight: FontWeight.bold,
        fontSize:12.0,
        color: Color(0xFFFF1C7B7B)
      ),
    ),
    title:  RichText(
      textAlign:  TextAlign.right,
      text:  TextSpan(

        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
           TextSpan(text: s.surahName,  style:  TextStyle( fontSize: 17.0, fontWeight: FontWeight.bold)),
           TextSpan(text:' $surahNumber', style:  TextStyle(fontSize: 16.0,color:Color(0xFFFF1C7B7B))),
        ],
      ),
    ),
    // title: Text(s.surahName! + '$surahNumber ', textAlign: TextAlign.right, style: TextStyle( fontWeight: FontWeight.bold)),
    trailing: Icon(Icons.api_rounded,color:const Color(0xFFFF1C7B7B),size: 20.0, ),
  );
}

