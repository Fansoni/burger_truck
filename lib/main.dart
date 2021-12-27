import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation carouselAnimation;

  int index = 0;

  var photoCarousel = [
    'assets/images/1.jpg', 'assets/images/2.jpg', 'assets/images/3.jpg',
    'assets/images/4.jpg', 'assets/images/5.jpg', 'assets/images/6.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 18), vsync: this);

    carouselAnimation = IntTween(begin: 0, end: photoCarousel.length - 1).animate(_controller)..addListener(() {
      setState(() {
        index = carouselAnimation.value;
      });
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(featureList[0].image);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 210.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(photoCarousel[index]),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    height: 210.0,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: (){}),
                        IconButton(icon: Icon(Icons.favorite, color: Colors.pinkAccent), onPressed: (){}),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 20.0,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star, size: 20.0, color: Colors.orange[700],),
                        Icon(Icons.star, size: 20.0, color: Colors.orange[700],),
                        Icon(Icons.star, size: 20.0, color: Colors.orange[700],),
                        Icon(Icons.star, size: 20.0, color: Colors.orange[700],),
                        Icon(Icons.star, size: 20.0, color: Colors.grey,),
                        SizedBox(width: 8.0,),
                        Text('4.7', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(width: 17.0,),
                        SelectedPhoto(photoLength: photoCarousel.length, indexSelected: index,),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'OPEN NOW UNTIL 7PM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'The Cinnamon Snail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        Text(
                          '17th st & Union Sq East',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0
                          ),
                        ),
                        SizedBox(width: 8.0,),
                        Icon(Icons.location_on, size: 19,),
                        SizedBox(width: 4.0,),
                        Text(
                          '400ft Away',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.wifi, size: 19, color: Colors.green[600],),
                        SizedBox(width: 4.0,),
                        Text(
                          'Location confirmed by 3 users today',
                          style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.0,),
                    Text(
                      'FEATURED ITEMS',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),
                    ),
                  ],
                ),
              ),
              FeaturedItem(
                image: 'assets/images/1.jpg',
                name: 'Maple Mustard Tempeh',
                description: 'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
                price: 11.25,
              ),
              SizedBox(height: 10.0,),
              FeaturedItem(
                image: 'assets/images/2.jpg',
                name: 'Maple Mustard Tempeh',
                description: 'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
                price: 12.25,
              ),
              SizedBox(height: 10.0,),
              FeaturedItem(
                image: 'assets/images/3.jpg',
                name: 'Maple Mustard Tempeh',
                description: 'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
                price: 13.25,
              ),
              SizedBox(height: 10.0,),
              FeaturedItem(
                image: 'assets/images/4.jpg',
                name: 'Maple Mustard Tempeh',
                description: 'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
                price: 14.25,
              ),
              SizedBox(height: 10.0,),
              FeaturedItem(
                image: 'assets/images/5.jpg',
                name: 'Maple Mustard Tempeh',
                description: 'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
                price: 15.25,
              ),
              SizedBox(height: 10.0,),
              FeaturedItem(
                image: 'assets/images/6.jpg',
                name: 'Maple Mustard Tempeh',
                description: 'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
                price: 16.25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturedItem extends StatelessWidget {
  final name, description, price, image;
  const FeaturedItem({
    Key key, this.name, this.description, this.price, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    '\$ ' + price.toString(),
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final photoLength, indexSelected;

  const SelectedPhoto({Key key, this.photoLength, this.indexSelected}) : super(key: key);

  Widget _dot(isSelected){
    return Container(
      margin: EdgeInsets.only(left: 3.0, right: 3.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: (isSelected)?Colors.white:Colors.grey,
      ),
    );
  }
  
  List<Widget> _buildDots(){
    List<Widget> list = [];
    for (var i = 0; i < photoLength; i++) {
      list.add(_dot((i == indexSelected)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDots()
    );
  }
}