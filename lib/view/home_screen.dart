import 'dart:math';

import 'package:aperitif/model/category_model.dart';
import 'package:aperitif/view/drink_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black87,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + kToolbarHeight,
                  left: 40
              ),
              child: const Text(
                'Choose your \nCategory',
                style: TextStyle(
                  letterSpacing: 1.3,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  height: 1.3,
                ),),

            ),
            Expanded(
                child: PageViewWidget(),
            ),
            SizedBox(
              height: size.height * 0.1,
            )
          ],
        ),
      )
    );
  }
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final List<CategoryModel> _list = CategoryModel.generate();

  late PageController pageController ;
  double viewportFraction = 0.8;
  late double pageOffset = 0;

  @override
  void initState(){
    super.initState();
    pageController = PageController(initialPage: 0 , viewportFraction: viewportFraction)
    ..addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageView.builder(
        controller: pageController,
        itemBuilder: (context,index){
          double scale = max(viewportFraction,(1-(pageOffset - index)).abs()+viewportFraction);
          double angle = (pageOffset - index).abs();

          if(angle > 0.5)
            {angle = 1 - angle;}
          return Container(
            padding: EdgeInsets.only(
              right: 10,
              top: 100 - scale * 25,
              bottom: 50,
              left: 20,
            ),
            child: Transform(
              transform: Matrix4.identity()
                         ..setEntry(3, 2, 0.001)
                         ..rotateY(angle),
              alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkList(title: _list[index].name)));
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        _list[index].url,
                        width: size.width,
                        height: size.height,
                        fit: BoxFit.cover,
                        alignment: Alignment((pageOffset- index).abs() * 0.5,0),
                      ),

                      Positioned(
                        left: 20,
                        bottom : 20,
                        child: AnimatedOpacity(
                            opacity: angle == 0 ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Hero(

                              tag: _list[index].name,
                              child: Text(
                                _list[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
          );
        },
      itemCount: _list.length,
    );
  }
}

