import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:space_app/planet/data.dart';

import 'package:space_app/utilities/constants.dart';

class DetailPage extends StatefulWidget {
  final PlanetInfo planetInfo;

  const DetailPage({super.key, required this.planetInfo});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
                spawnMaxRadius: 10,
                spawnMaxSpeed: 50,
                spawnMinRadius: 5,
                particleCount: 68,
                minOpacity: 0.3,
                baseColor: Colors.red,
                spawnMinSpeed: 10,
                spawnOpacity: 0.4)),
        vsync: this,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 300),
                          Text(
                            widget.planetInfo.name,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Divider(color: Colors.black38),
                          const SizedBox(height: 32),
                          Text(
                            widget.planetInfo.description,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: contentTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Divider(color: Colors.black38),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 25,
                          color: Color(0xff47455f),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.only(left: 32.0),
                      child: ListView.builder(
                          itemCount: widget.planetInfo.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    widget.planetInfo.images[index],
                                    fit: BoxFit.cover,
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -64,
                child: Hero(
                    tag: widget.planetInfo.position,
                    child: Image.asset(widget.planetInfo.iconImage)),
              ),
              Positioned(
                top: 60,
                left: 32,
                child: Text(
                  widget.planetInfo.position.toString(),
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 247,
                    color: primaryTextColor.withOpacity(0.08),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
