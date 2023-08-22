import 'package:burger_truck/widgets/carousel_dot.dart';
import 'package:burger_truck/widgets/featured_item.dart';
import 'package:burger_truck/widgets/stars_component.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation carouselAnimation;

  int index = 0;

  List<String> photoCarousel = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);

    carouselAnimation =
        IntTween(begin: 0, end: photoCarousel.length - 1).animate(_controller)
          ..addListener(() {
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
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CarouselSection(photoCarousel: photoCarousel, index: index),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'OPEN NOW UNTIL 7PM',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'The Cinnamon Snail',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: <Widget>[
                    Text(
                      '17th st & Union Sq East',
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.location_on, size: 19),
                    SizedBox(width: 4.0),
                    Text(
                      '400ft Away',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.wifi,
                      size: 19,
                      color: Colors.green[600],
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      'Location confirmed by 3 users today',
                      style: TextStyle(
                        color: Colors.green[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'FEATURED ITEMS',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          const FeaturedSection(),
        ],
      ),
    );
  }
}

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeaturedItem(
          image: 'assets/images/1.jpg',
          name: 'Maple Mustard Tempeh',
          description:
              'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
          price: 11.25,
        ),
        SizedBox(height: 10.0),
        FeaturedItem(
          image: 'assets/images/2.jpg',
          name: 'Maple Mustard Tempeh',
          description:
              'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
          price: 12.25,
        ),
        SizedBox(height: 10.0),
        FeaturedItem(
          image: 'assets/images/3.jpg',
          name: 'Maple Mustard Tempeh',
          description:
              'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
          price: 13.25,
        ),
        SizedBox(height: 10.0),
        FeaturedItem(
          image: 'assets/images/4.jpg',
          name: 'Maple Mustard Tempeh',
          description:
              'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
          price: 14.25,
        ),
        SizedBox(height: 10.0),
        FeaturedItem(
          image: 'assets/images/5.jpg',
          name: 'Maple Mustard Tempeh',
          description:
              'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
          price: 15.25,
        ),
        SizedBox(height: 10.0),
        FeaturedItem(
          image: 'assets/images/6.jpg',
          name: 'Maple Mustard Tempeh',
          description:
              'Madsahdgasjhd hjagsdhhasdghasgd hjagdjhasgjhdgash gjhagsdjhg hdgsad hdghsd',
          price: 16.25,
        ),
      ],
    );
  }
}

class CarouselSection extends StatelessWidget {
  const CarouselSection({
    super.key,
    required this.photoCarousel,
    required this.index,
  });

  final List<String> photoCarousel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(photoCarousel[index]),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.pinkAccent),
                  onPressed: () {}),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                const StarsComponent(number: 4),
                const SizedBox(width: 8.0),
                const Text(
                  '4.7',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 17.0),
                CarouselDots(
                  photoLength: photoCarousel.length,
                  indexSelected: index,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
