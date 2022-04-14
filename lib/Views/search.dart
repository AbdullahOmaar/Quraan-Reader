import 'package:flutter/material.dart';
import '../View_Model/create_db.dart';
import '../Models/Aya.dart';
import '../Services.dart';


void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Search(),
    );
  }
}


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}





class _SearchState extends State<Search> {


   int  _contentNumber=0;
  final int  _threshold=4;
  bool _loading=false;
  bool _resultVisibility=false;
  bool _contentError = false;
  ScrollController? _scrollController;
  List<Aya> _results=[];
  //
  //
  duh  () async
  {
    // print("ANA GWA EL DUH");
    // var out=await DBHelper.instance.readAllAya();
    await loadSurahsNames();
    // print(out);
    // print("Ba3d el functioooooooooooon");
  }

  @override
  void initState()  {
    // TODO: implement initState
    // super.initState();
    DBHelper.instance.database;
    _scrollController =  ScrollController(initialScrollOffset: 5.0);
    duh();



  }

  fetchResults(String keyword) async {
    if (keyword.isEmpty)
    {
      _contentNumber=0;

    }
    else
    {
      _results =await  DBHelper.instance.search(keyword);
      // print("----------------");
      // print(_results[0].pageNumber);
      _contentNumber= _results.length;
    }

    // print(_results.length);

    setState (()   {
      _results=_results;
      _contentNumber= _contentNumber;
      if (_contentNumber==0)
        {
          _resultVisibility=false;
        }
      else
        {
          _resultVisibility=true;
        }

    });

  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor:const Color(0xFF94C2B6),
          actions: <Widget> [
               Container(
                 child: const Padding(
                   padding:  EdgeInsets.all(16),
                   child:  Text(
                       "البحث  ",
                       style: TextStyle(
                           color: Colors.black87,
                           fontWeight: FontWeight.bold,
                           fontSize: 20
                       )
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
          centerTitle: true,
        ),
          body: Column(
            children:
            [
              Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                  color: const Color(0xFF94C2B6)
              ),
                child:  Center(
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration:const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: InputBorder.none,
                        hintText: 'بحث',
                    ),
                      onChanged: (String keyword) async {
                        fetchResults(keyword);
                        setState (()   {
                          //TODO: Retrieve results
                        });
                      },

                  ),
                ),
            ),

              Visibility(
                  visible: _resultVisibility,
                  child: Container(
                    color: Colors.blueGrey.shade800,
                    height: 50.0,
                    child: ListTile(
                        title: Text(
                          'الآيات ($_contentNumber)',
                            textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)

                        )
                    ),
                  )

              ),

              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: _contentNumber,
                    shrinkWrap: true,
                    itemBuilder:
                        (BuildContext context, int index) {
                      if (index ==
                          _contentNumber -
                              _threshold) {
                        print("Reached end of list");
                        // viewUsers();
                      }
                      if (index == _contentNumber) {
                        if (_contentError) {
                          return Expanded(
                            // height: 50,
                            // width: 100,
                            child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _loading = true;
                                      _contentError = false;
                                      print("Error");
                                      // viewUsers();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Error while loading results, tap to try again"),
                                  ),
                                )),
                          );
                        } else {}
                      }
                      return buildListTile(_results[index]);
                    }),
              ),
            ],
          ),
      );
  }
}


Container buildListTile(Aya result) {
  int? page = result.pageNumber;
  // print(page);
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, // Your desired background color
        // borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius:0.2),
        ]
    ),
    child: ListTile(
      onTap: (){
        //TODO: Navigate to Aya page
        print("Tapped");
      },
      leading: Text("$page صفحة",
          style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize:12.0,
          ),
    ),
      title: Row(
        mainAxisAlignment:  MainAxisAlignment.end,
          children: [
        Text(
            result.surahName!,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.bold)),
            Icon(
                Icons.arrow_drop_up_rounded,
                color:const Color(0xFFFF1C7B7B)
            ),
          ]
      ),
      // trailing:
      subtitle: Text(result.ayaText!, textAlign: TextAlign.right),
    ),
  );
}