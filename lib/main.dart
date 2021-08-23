import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ionicons/ionicons.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:placement_notes/webView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placement Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            )
          )
        ),
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        fontFamily: 'Nunito'
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Placement Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontSize: 20,fontFamily: 'Nunito',fontWeight: FontWeight.bold),),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline_rounded,color: Colors.black87,),
            onPressed: () {

            },
          ),
        ],
      ),
      drawer:  Drawer(
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text('Contact Developer'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 3,
                        //     blurRadius: 4,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                    ),

                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Computer Network",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "description",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ActionChip(
                            label: const Text('Cisco'),
                            backgroundColor: Colors.grey.shade100,
                            onPressed: () {
                              print('If you stand for nothing, Burr, what’ll you fall for?');
                            }
                        ),
                        CupertinoButton(
                          child: Text('Read Notes'),
                          color: CupertinoColors.activeBlue,
                          padding: EdgeInsets.all(13),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageF()),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 3,
                      //     blurRadius: 4,
                      //     offset: Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),

                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "DBMS",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "description",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ActionChip(
                            label: const Text('Cisco'),
                            backgroundColor: Colors.grey.shade100,
                            onPressed: () {
                              print('If you stand for nothing, Burr, what’ll you fall for?');
                            }
                        ),
                        CupertinoButton(
                          child: Text('Read Notes'),
                          color: CupertinoColors.activeBlue,
                          padding: EdgeInsets.all(13),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageF()),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 3,
                      //     blurRadius: 4,
                      //     offset: Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),

                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Operating System",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "description",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ActionChip(
                            label: const Text('Cisco'),
                            backgroundColor: Colors.grey.shade100,
                            onPressed: () {
                              print('If you stand for nothing, Burr, what’ll you fall for?');
                            }
                        ),
                        CupertinoButton(
                          child: Text('Read Notes'),
                          color: CupertinoColors.activeBlue,
                          padding: EdgeInsets.all(13),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageF()),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 3,
                      //     blurRadius: 4,
                      //     offset: Offset(0, 3), // changes position of shadow
                      //   ),
                      // ],
                    ),

                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Computer Network",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "description",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ActionChip(
                            label: const Text('Cisco'),
                            backgroundColor: Colors.grey.shade100,
                            onPressed: () {
                              print('If you stand for nothing, Burr, what’ll you fall for?');
                            }
                        ),
                        CupertinoButton(
                          child: Text('Read Notes'),
                          color: CupertinoColors.activeBlue,
                          padding: EdgeInsets.all(13),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PageF()),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
