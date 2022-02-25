import 'package:aperitif/model/drink.dart';
import 'package:aperitif/widget/drink_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrinkList extends StatefulWidget {
  static const String id = 'drink_list';
  final String title;
  const DrinkList({required this.title});

  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  final List<Widget> _drinkTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Tween<Offset> _offset = Tween(begin: Offset(1,0), end: Offset(0,0));
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _addTrips();
    });
  }
  
  void _addTrips(){
    List<Drink> _drinks = [
      Drink(name: 'a',img: 'assets/categories_image/Cocoa.jpg',recipe: ''),
      Drink(name: 'b',img: 'assets/categories_image/Cocoa.jpg',recipe: ''),
      Drink(name: 'c',img: 'assets/categories_image/Cocoa.jpg',recipe: ''),
      Drink(name: 'd',img: 'assets/categories_image/Cocoa.jpg',recipe: ''),
      Drink(name: 'e',img: 'assets/categories_image/Cocoa.jpg',recipe: ''),
    ];
    Future ft = Future((){});
    _drinks.forEach((Drink drink){

      ft = ft.then((_) {
       return Future.delayed(const Duration(milliseconds: 100),(){
      _drinkTiles.add(DrinkTile().buildTile(drink, context));
      _listKey.currentState!.insertItem(_drinkTiles.length - 1);
      });
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Hero(
                  tag: widget.title,
                  child: Text(
                      widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      letterSpacing: 1.3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      height: 1.3,
                    ),),
                ),
              ),
            ),
            Flexible(
              child: AnimatedList(
                  key: _listKey,
                   initialItemCount: _drinkTiles.length,
                   itemBuilder: (context,index,animation){
                      return SlideTransition(
                        child: _drinkTiles[index],
                        position: animation.drive(_offset),
                      );
                   },
                  ),
            )
          ]
        ),
      )
    );
  }
}
