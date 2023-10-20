// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../util.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String temp = categories[sel_index];
  Uint8List? asUint8List;
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Quotes"),
        centerTitle: true,
        elevation: 0.1,
      ),
      body: SizedBox(
        height: 900,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            var quote = getQuote(temp)[qt_index];
            return Column(
              children: [
                RepaintBoundary(
                  child: Container(
                    height: 750,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(bg_images[sel_index]),
                          fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: Text(
                          quote,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 140),
                    IconButton(
                        onPressed: () async {
                          // To get byte data
                          RenderRepaintBoundary? renderObject =
                              key.currentContext?.findRenderObject()
                                  as RenderRepaintBoundary?;
                          var image = await renderObject?.toImage();
                          ByteData? byteData = await image?.toByteData(
                              format: ImageByteFormat.png);
                          asUint8List = byteData?.buffer.asUint8List();

                          // To save file
                          var applicationDocumentsDirectory =
                              await getApplicationDocumentsDirectory();
                          var date = DateTime.now().toString();
                          String filePath =
                              "${applicationDocumentsDirectory.path}/${date}_img.jpg";
                          File file = File(filePath);
                          await file.writeAsBytes(asUint8List?.toList() ?? []);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Center(child: Text("Download Successfully",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.black,
                          ));
                        },
                        icon: Icon(Icons.download_for_offline,
                            color: Colors.black, size: 45)),
                    SizedBox(width: 20),
                    IconButton(
                        onPressed: () {
                          Fav_Quotes.add(quote);
                          print("Legnth");
                          print(Fav_Quotes.length);
                        },
                        icon: Icon(Icons.favorite,
                            color: Colors.black, size: 45)),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  List<String> getQuote(String q) {
    print(q);
    if (q == "Love") {
      return Love;
    } else if (q == "Calm") {
      return Calm;
    } else if (q == "Sad") {
      return Sad;
    } else if (q == "Time") {
      return Time;
    } else if (q == "Future") {
      return Future;
    } else if (q == "Relationship") {
      return Relationship;
    } else {
      return [];
    }
  }
}
