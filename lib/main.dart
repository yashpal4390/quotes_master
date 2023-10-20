// ignore_for_file: avoid_print, prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, must_be_immutable
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:quotes_master/screens/detail_page.dart';
import 'package:quotes_master/screens/favorite.dart';
import 'package:quotes_master/screens/second_page.dart';
import 'constant.dart';
import 'util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryList(),
      routes: {
        homePage: (context) => CategoryList(),
        second_page: (context) => SecondPage(),
        detail_page: (context) => DetailPage(),
        fav_page: (context) => FavoritePage(),
      },
    );
  }
}

class CategoryList extends StatefulWidget {

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Quote',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: Icon(Icons.menu,color:Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, fav_page);
              },
                child: Icon(Icons.favorite_border_outlined,color: Colors.black)),
          )
        ],
      ),
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      List<WordPair> Love = generateWordPairs().take(50).toList();
                      List<WordPair> Sad = generateWordPairs().take(50).toList();
                      List<WordPair> filteredLoveList = [];
                      List<WordPair> filteredSadList = [];
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text("Categories", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    sel_index=index;
                    print(sel_index);
                    Navigator.pushNamed(context,second_page);
                  },
                  child: Container(
                    height: 130,
                    width: 300,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image: AssetImage(images[index]), fit: BoxFit.cover),
                        color: Colors.blueGrey),
                    child: Stack(
                      children: [
                        Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.black54,
                            ),
                            child: Center(
                                child: Text(categories[index], style: sty))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
