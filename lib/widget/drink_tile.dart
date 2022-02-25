import 'package:aperitif/model/drink.dart';
import 'package:aperitif/view/drink_recipe.dart';
import 'package:flutter/material.dart';
import 'package:aperitif/widget/heart.dart';

class DrinkTile{
  Widget buildTile(Drink drink,context){
    return ListTile(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => DrinkDetails()));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Text(
        drink.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(drink.img,height: 100,),
      ),
        trailing: Heart(),
    );
  }
}