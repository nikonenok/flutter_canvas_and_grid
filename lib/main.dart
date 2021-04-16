import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'ma_painter.dart';
import 'border_canvas.dart';
import 'borded_painter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 100,
              backgroundColor: Colors.amber,
              iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Top Bar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Hero')),
                centerTitle: true,
              ),
              leading: IconButton(
                icon: Image.asset('assets/images/logo.png'),
                onPressed: () { },
              ),
              actions: <Widget>[
                PopupMenuButton(itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(child: Text('Profile')),
                    PopupMenuItem(child: Text('Main Menu')),
                    PopupMenuItem(child: Text('Settings')),
                  ];
                }),
                IconButton(
                  icon: Icon(
                    Icons.whatshot,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: null,
                ),
              ],
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 7.0,
                crossAxisSpacing: 7.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.amber[100 * (index % 9)],
                    child: Text('Grid Item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverFillRemaining(
                child: Center(
                  child: MaPainter()
                )
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.amber[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                },
              ),
            )],
            ),
      )));
}