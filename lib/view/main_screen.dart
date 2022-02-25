

import 'dart:math';

import 'package:aperitif/view/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double value = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade400,
                    Colors.blue.shade800,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
            ),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(height: 10.0,),
                            const Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            ListView(
                              children: [
                                ListTile(
                                  onTap: (){},
                                  leading: const Icon(
                                      Icons.home,
                                      color: Colors.white
                                  ),
                                  title: const Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                ),
                                ListTile(
                                  onTap: (){},
                                  leading: const Icon(
                                      Icons.favorite,
                                      color: Colors.white
                                  ),
                                  title: const Text(
                                    'Favorite',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                ),
                                ListTile(
                                  onTap: (){},
                                  leading: const Icon(
                                      Icons.settings,
                                      color: Colors.white
                                  ),
                                  title: const Text(
                                    'Settings',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                ),
                                ListTile(
                                  onTap: (){},
                                  leading: const Icon(
                                      Icons.logout,
                                      color: Colors.white
                                  ),
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                ),
                              ],
                            )
                          ],
                        )
                    )
                  ]

              ),
            ),
          ),

          TweenAnimationBuilder(
              tween: Tween<double>(begin : 0, end : value),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              builder: (_,double val,___){
                return (
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3,2,0.001)
                        ..setEntry(0, 3, 200 * val)
                        ..rotateY((pi /6 ) * val),
                      child: const HomeScreen()
                    ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if(e.delta.dx > 0) {
                setState((){
                  value = 1;
                });
              } else {
                setState((){
                  value = 0;
                });
              }
            } ,
          )
        ],
      ),
    );
  }
}
