// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotes_master/constant.dart';
import 'package:quotes_master/util.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String temp = categories[sel_index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, homePage);
            },
            icon: Icon(
              Icons.home,
              color: Colors.black,
            )),
        actions: [Icon(Icons.search, color: Colors.black)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        sel_index = index;
                        temp = categories[sel_index];
                        print(sel_index);
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 51,
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Text(categories[index]),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  height: 160,
                  width: 380,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(bg_images[sel_index]),
                        fit: BoxFit.fill),
                  ),
                  child: Align(
                      alignment: Alignment(-0.9, -0.7),
                      child: ActionChip(
                          label: Title(
                              color: Colors.white,
                              child: Text(categories[sel_index], style: sty)))),
                );
              },
            ),
          ),
          SizedBox(
            height: 400,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: getQuote(temp).length,
              itemBuilder: (context, index) {
                var quote = getQuote(temp)[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      qt_index=index;
                      Navigator.pushNamed(context, detail_page);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(bg_images[sel_index]),
                              fit: BoxFit.fill),
                        ),
                        child: Text(quote, style: sty1)),
                  ),
                );
              },
            ),
          ),
        ],
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
