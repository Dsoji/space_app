// ignore_for_file: library_private_types_in_public_api

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

import 'package:space_app/planet/details_page.dart';
import 'package:space_app/utilities/constants.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                spawnMaxRadius: 30,
                spawnMaxSpeed: 50,
                spawnMinRadius: 10,
                particleCount: 68,
                minOpacity: 0.3,
                baseColor: Colors.black26,
                spawnMinSpeed: 10,
                spawnOpacity: 0.4)),
        vsync: this,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Planets',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              child: Text(
                                'Solar System',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset('assets/drop_down_icon.png'),
                          ),
                          underline: const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 550,
                    padding: const EdgeInsets.only(left: 32),
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: const SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 10, space: 8),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailPage(
                                  planetInfo: planets[index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  const SizedBox(height: 200),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: Colors.white,
                                    child: SizedBox(
                                      height: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(height: 70),
                                            Text(
                                              planets[index].name,
                                              style: const TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 44,
                                                color: Color(0xff47455f),
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              'Solar System',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 23,
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(height: 50),
                                            GestureDetector(
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Know more',
                                                    style: TextStyle(
                                                      fontFamily: 'Avenir',
                                                      fontSize: 18,
                                                      color: secondaryTextColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: secondaryTextColor,
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder:
                                                        (context, a, b) =>
                                                            DetailPage(
                                                      planetInfo:
                                                          planets[index],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Hero(
                                tag: planets[index].position,
                                child: Image.asset(planets[index].iconImage),
                              ),
                              Positioned(
                                right: 24,
                                bottom: 60,
                                child: Text(
                                  planets[index].position.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 200,
                                    color: primaryTextColor.withOpacity(0.08),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: const BorderRadius.vertical(
      //       top: Radius.circular(36.0),
      //     ),
      //     color: navigationColor,
      //   ),
      //   padding: const EdgeInsets.all(24),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Image.asset('assets/menu_icon.png'),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Image.asset('assets/search_icon.png'),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Image.asset('assets/profile_icon.png'),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
