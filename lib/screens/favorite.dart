import 'package:flutter/material.dart';
import 'package:quotes_master/util.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Quotes'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: Fav_Quotes.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.cyan
              ),
              child: ListTile(
                title: Center(child: Text(Fav_Quotes.elementAt(index))),
              ),
            );
        },)
    );
  }
}
