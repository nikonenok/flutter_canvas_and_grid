import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'ma_canvas.dart';


class MaPainter extends StatefulWidget {
  @override
  _MaPainterState createState() => _MaPainterState();
}

class _MaPainterState extends State<MaPainter> {
  @override
  void initState() {
    super.initState();
    // Load IMG
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap:  () {
            setState(() {
              this.selectIndex++;
              this.selectedImage = this.images.length > 0
                  ? this.images[this.selectIndex % this.images.length]
                  : null;
            });
          },
          child: CustomPaint(
              child: Container(),
              painter: MaCanvas(this.selectedImage)
                ),
        ),
        );
  }

  // ignore: deprecated_member_use
  var images = new List<ui.Image>();
  ui.Image selectedImage;
  int selectIndex = 0;

  void loadImages() {
    var names = ["01.jpg", "02.jpg", "03.jpg"];
    names.forEach((name) {
      rootBundle.load("assets/images/tower_" + name).then( (bd){
        decodeImageFromList(bd.buffer.asUint8List()).then((img){
          setState(() {
            this.images.add(img);
            this.selectedImage = this.images.length > 0 ? this.images[0] : null;
          });
        });
      });
    });
  }
}
