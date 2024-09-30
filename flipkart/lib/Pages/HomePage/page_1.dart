import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipkart/Data_Insert/datastore.dart';
import 'package:flipkart/widgets_template.dart';
import 'package:flutter/material.dart';

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  String imageLink =
      "https://raw.githubusercontent.com/RAJASURYA2002/Flipkartimages/main/images/";
  int current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xffd0e2ff),
              expandedHeight: 130,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //section_1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopContainerLogo(
                            color: Color(0xff2873f0),
                            image: Image.asset(
                              "assets/Bottom_Images/fliplogo.png",
                            ),
                          ),
                          TopContainerLogo(
                            color: Color(0xfff3f4f8),
                            image: Image.network(
                              "${imageLink}grocery_icon.png",
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //part 1
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand Mall",
                            style: TextStyle(
                                color: Color(0xff63636b),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 55,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Color(0xffd6d7db),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "OFF",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 290,
                        height: 45,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xfff6f7fb),
                          border: Border.all(color: Color(0xff7d7f80)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Color(0xff7d7f80),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Mobile Phone",
                                  style: TextStyle(
                                    color: Color(0xff7d7f80),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mic,
                                  color: Color(0xff7d7f80),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.photo_camera,
                                  color: Color(0xff7d7f80),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // section_3 (Advertisement)
                  SizedBox(
                    height: 5,
                  ),
                  Image.network(
                    "${imageLink}Advertisement_1.png",
                  ),

                  // part-3 (Banner)
                  CarouselSlider(
                    items: imageList,
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      animateToClosest: false,
                      autoPlayCurve: Curves.easeIn,
                      enlargeCenterPage: true,
                      aspectRatio: 3.0,
                      viewportFraction: 1.9,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CricleSlide(
                            image: "${gitImageLink}qr.png",
                            tag: true,
                            tagName: "NEW",
                            circleName: "Scan & Pay",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CricleSlide(
                            image: "${gitImageLink}goad sale.png",
                            tag: false,
                            tagName: "",
                            circleName: "Sneak Peek",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CricleSlide(
                            image: "${gitImageLink}fas.png",
                            tag: false,
                            tagName: "",
                            circleName: "Spoyl\nFashion",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CricleSlide(
                            image: "${gitImageLink}mobile.png",
                            tag: false,
                            tagName: "",
                            circleName: "Mobile",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CricleSlide(
                            image: "${gitImageLink}flight.png",
                            tag: false,
                            tagName: "",
                            circleName: "Flights & \nHotels",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CricleSlide(
                            image: "${gitImageLink}speaker.png",
                            tag: false,
                            tagName: "",
                            circleName: "Smart \nGadgets",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CricleSlide(
                            image: "${gitImageLink}goad sale.png",
                            tag: false,
                            tagName: "",
                            circleName: "Sneak Peek",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // section_4
                  Row(
                    children: [
                      ThreeImage(
                        image: "${gitImageLink}3-1.png",
                        text1: "Kitchen Staples",
                        text2: "Upto 70% Off",
                      ),
                      ThreeImage(
                        image: "${gitImageLink}3-2.png",
                        text1: "Acer Pure TVs",
                        text2: "Launching 12PM",
                      ),
                      ThreeImage(
                        image: "${gitImageLink}3-3.png",
                        text1: "Watch Pro 2",
                        text2: "Sale Today, 12 PM",
                      ),
                    ],
                  ),
                  Image.network("${gitImageLink}banner_2.png"),
                  Row(
                    children: [
                      ThreeImage(
                        image: "${gitImageLink}3-1.png",
                        text1: "Kitchen Staples",
                        text2: "Upto 70% Off",
                      ),
                      ThreeImage(
                        image: "${gitImageLink}3-2.png",
                        text1: "Acer Pure TVs",
                        text2: "Launching 12PM",
                      ),
                      ThreeImage(
                        image: "${gitImageLink}3-3.png",
                        text1: "Watch Pro 2",
                        text2: "Sale Today, 12 PM",
                      ),
                    ],
                  ),
                  Image.network("${gitImageLink}banner_3.png"),
                  Image.network("${gitImageLink}banner_4.png"),
                  Image.network("${gitImageLink}banner_5.png"),
                  Image.network("${gitImageLink}banner_6.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hang on, loading content",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7d7f80),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(
                    strokeWidth: 3.0,
                    color: Color(0xff2c5fa4),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
