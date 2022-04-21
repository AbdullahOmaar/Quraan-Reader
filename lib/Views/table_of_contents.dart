
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../View_Model/create_db.dart';
import '../Services.dart';
import '../Models/Surah.dart';
import 'pages.dart';

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
      home: TableOf(),
    );
  }
}


class TableOf extends StatefulWidget {
  const TableOf({Key? key}) : super(key: key);

  @override
  State<TableOf> createState() => _TableOfState();
}


List<String> parts =["الجزء 1",
  "الجزء 2","الجزء 3",
  "الجزء 4",
  "الجزء 5",
  "الجزء 6",
  "الجزء 7",
  "الجزء 8",
  "الجزء 9",
  "الجزء 10",
  "الجزء 11",
  "الجزء 12",
  "الجزء 13",
  "الجزء 14","الجزء 15","الجزء 16",
  "الجزء 17",
  "الجزء 18",
  "الجزء 19",
  "الجزء 20",
  "الجزء 21",
  "الجزء 22",
  "الجزء 23",
  "الجزء 24",
  "الجزء 25",
  "الجزء 26",
  "الجزء 27",
  "الجزء 28",
  "الجزء 29",
  "الجزء 30"
];


List <int> pages =[
1,
22,
42,
62,
82,
102,
121,
142,
162,
182,
201,
222,
242,
262,
282,
302,
322,
342,
362,
382,
402,
422,
442,
462,
482,
502,
522,
542,
562,
582
];


class _TableOfState extends State<TableOf> with SingleTickerProviderStateMixin{
   int  _contentNumber=0;
  final int  _threshold=4;
   bool _loading=false;
   bool _conetntError = false;
   List<dynamic>? _surahs;
  ScrollController? _scrollController;
  TabController? _tabController;
  late Future<dynamic> _futureVar;

  getSurahs() async {
    _surahs = await DBHelper.instance.readAllSurahs();
    setState(() {
      _contentNumber=_surahs!.length;
    });
    return 1;
  }

  fetchResults(String keyword) async {
    if (keyword.isEmpty)
    {
      // _surahs = await DBHelper.instance.readAllSurahs();
      // print(_surahs!.length);
      await getSurahs();
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
      // print("CONTENT NUMBEEEEEEEEEEEEEER:");
      // print(_contentNumber);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureVar = getSurahs();
    // DBHelper.instance.database;


    _scrollController =  ScrollController(initialScrollOffset: 5.0);
    _tabController =  TabController(length:2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureVar ,
        builder: (context, snapshot) {
          if (snapshot.data == null) {

            return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color(0xFF94C2B6),
                  // title: const Text('الفهرس'),
                  actions: <Widget>[
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
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
              body: Image.asset('assets/app.png',  height: 600,
                width: 600,),
            );
            // return  Center(
            //
            //   child:  Column(
            //     children: [
            //       Container(
            //         height: 300,
            //         color: Colors.white,
            //           child:Card(child:Image.asset('./assets/Quran.JPG')),
            //       ),
            //     ],
            //   )
            // );
          }
          else {
            return DefaultTabController(
              initialIndex: 1,
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color(0xFF94C2B6),
                  // title: const Text('الفهرس'),
                  bottom: const TabBar(
                      tabs: <Widget>[
                        Tab(
                          icon: Text("الأجزاء", style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                        ),
                        Tab(
                          icon: Text("السور", style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                        ),
                      ],
                      indicatorColor: const Color(0xFFFF1C7B7B)
                  ),
                  actions: <Widget>[
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
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
                body: TabBarView(
                  children: [
                    // Icon(Icons.directions_car),
                    // Icon(Icons.directions_transit),
                    // controller: _tabController,
                    // children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: parts.length,
                    shrinkWrap: true,

                    itemBuilder:
                    (BuildContext context, int index) {
                      return buildTile(parts[index],context,index);
                    },

                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 4.0,
                      );
                    }
                  ),
                    Column(
                      children:
                      [
                        Container(
                          height: 55,
                          color: const Color(0xFF94C2B6),
                          padding: const EdgeInsets.all(6),
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFFFF1C7B7B),
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
                            onChanged: (keywords) async {
                              await fetchResults(keywords);
                              setState(() {
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
                                return buildListTile(_surahs![index], context);
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
        },
    );
  }
}

ListTile buildListTile(Surah s,BuildContext context) {
  int surahNumber=s.surahNumber!;
  int page = s.surahPage!;
  return ListTile(
    onTap: (){
      int indx=page-1;

      if (page>553)
      {
        indx+=1;
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage(ind:pages[indx])));
      // print(s.surahPage);
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



ListTile buildTile(String part, BuildContext context, int index)
{
  return ListTile(
    onTap: (){

      // Navigator.pop(context);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage(ind:pages[index])));
      // print(s.surahPage);
    },
    title: Text(part, textAlign: TextAlign.right,style:  TextStyle( fontSize: 17.0, fontWeight: FontWeight.bold)),
    trailing: Icon(Icons.workspaces_outline,color:const Color(0xFFFF1C7B7B),size: 20.0, ),
  );
}




