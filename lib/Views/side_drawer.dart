import 'package:flutter/material.dart';
import 'search.dart';
import 'table_of_contents.dart';
import 'ElFawasel.dart';
import 'ElKhawater.dart';
import 'favourites.dart';




class sideDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor:const Color(0xFF94C2B6),
      child: ListView(
          children: [
            // DrawerHeader(
            //   child: Text(''),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       image: DecorationImage(
            //           image: AssetImage("assets/Quran.JPG"),
            //           fit: BoxFit.cover)
            //   ),
            // ),
            ListTile(
              leading: Icon(Icons.list_alt, color: Colors.white),
              title: Text('الفهرس',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TableOf()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.search,  color: Colors.white),
              title: Text('بحث',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search()),
                );
              },

            ),
            ListTile(
              leading: Icon(Icons.bookmark,  color: Colors.white),
              title: Text('الفواصل',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ElFawasel()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite,  color: Colors.white),
              title: Text('المفضلة',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
              ),
    ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favourites()),
                );
              },
            ),

            ListTile(
              //const Color(0xFF94C2B6)
              leading: Icon(Icons.note,  color: Colors.white),
              title: Text('الخواطر',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ElKhawater(),
                ));
              },
            ),
          ]

        // child: Container(
        //   color: kPrimaryColor,
        //   child: Padding(
        //     padding:
        //         EdgeInsets.only(top: 1.h, left: 6.w, right: 6.w, bottom: 5.h),
        //     child: SingleChildScrollView(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           DrawerItem(
        //             title: kDrawerTitleFirstText,
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 ColoredCircle(
        //                   color: kMainGreenColor,
        //                   onPressed: (color) {
        //                     file.saveTheme(color: "green");
        //                     colorChanged(color);
        //                   },
        //                 ),
        //                 ColoredCircle(
        //                   color: kMainBlueColor,
        //                   onPressed: (color) {
        //                     file.saveTheme(color: "blue");
        //                     colorChanged(color);
        //                   },
        //                 ),
        //                 ColoredCircle(
        //                   color: kMainOrangeColor,
        //                   onPressed: (color) {
        //                     file.saveTheme(color: "orange");
        //                     colorChanged(color);
        //                   },
        //                 ),
        //                 ColoredCircle(
        //                   color: kMainPinkColor,
        //                   onPressed: (color) {
        //                     file.saveTheme(color: "pink");
        //                     colorChanged(color);
        //                   },
        //                 ),
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             height: 3.h,
        //           ),
        //           DrawerItem(
        //             title: kDrawerTitleSecondText,
        //             desc: Provider.of<MyModel>(context, listen: false)
        //                     .getPerson()
        //                     .firstName
        //                     .toString() +
        //                 " " +
        //                 Provider.of<MyModel>(context, listen: false)
        //                     .getPerson()
        //                     .lastName
        //                     .toString(),
        //           ),
        //           SizedBox(
        //             height: 3.h,
        //           ),
        //           DrawerItem(
        //               title: kDrawerTitleThirdText,
        //               desc: kDrawerDependenciesDescText),
        //           SizedBox(
        //             height: 3.h,
        //           ),
        //           DrawerItem(
        //             title: "Log out",
        //             child: IconButton(
        //               icon: const Icon(Icons.cached),
        //               color: Colors.white,
        //               onPressed: () {
        //                 Navigator.of(context)
        //                     .push(MaterialPageRoute(builder: (context) {
        //                   return Login();
        //                 }));

        //                 Provider.of<MyModel>(context, listen: false).removeAll();
        //               },
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
      ),
    );
  }
}
