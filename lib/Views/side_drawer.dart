import 'package:flutter/material.dart';

class sideDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              leading: Icon(Icons.list_alt, color: const Color(0xFF94C2B6)),
              title: Text('قائمة التحميلات'),
              onTap: (){
                print('قائمة التحميلات');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,  color: const Color(0xFF94C2B6)),
              title: Text('الإعدادات'),
              onTap: (){
                print('الإعدادات');
              },

            ),
            ListTile(
              title: Text('عن كتاب التفسير'),
              onTap: (){
                print('عن كتاب التفسير');
              },
            ),
            ListTile(
              title: Text('عن المصحف'),
              onTap: (){
                print('عن المصحف');
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
