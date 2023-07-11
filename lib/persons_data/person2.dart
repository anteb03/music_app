import 'package:aplikacija1/albums_songs/album2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Person2 extends StatefulWidget {
  const Person2({super.key});

  @override
  State<Person2> createState() => _Person2State();
}

class _Person2State extends State<Person2> {
  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'lib/persons_pictures/acopejovicc.jpg',
                  fit: BoxFit.cover,
                  width: 500,
                ),
              ),
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: MediaQuery.of(context).size.height * 0.30,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 950,
                width: 450,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 370,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 350,
                          child: Text(
                            'Aco Pejović',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 350,
                            child: ReadMoreText(
                              'Aco Pejović, full name Aleksandar, is one of the most popular folk singers in Balkan area. He was born on April 18, 1972 in Prijepolje, Serbia. He has been singing since the age of 14. He played in Podgorica and Prijepolje, and after finishing secondary music school he lived and worked in France. After returning from France, where he did manual labor, he went to serve his military service in Croatia, and after that he started playing in bars in Prijepolje.'
                              'At the beginning, he played in a pizzeria on Zvezdara, and soon other owners of the place heard about him. A few years later, he acquired the status of "king of rafts"("kralj splavova").Today, he is an extremely searched singer and big star with a large number of hits and albums. ',
                              trimLines: 1,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more.',
                              trimExpandedText: 'Show less.',
                              lessStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              moreStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            'Albums:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Album2(),
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 250)));
                            },
                            child: Playlists(
                                label: '2010',
                                image: AssetImage(
                                  'lib/albums_pictures/acopejovic.jpg',
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            'News & more:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 350,
                          child: GestureDetector(
                            onTap: () {
                              openUrl(
                                  'https://www.vecernji.hr/tag/aco-pejovic-377500');
                            },
                            child: Text(
                              'Click link there',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}

class Playlists extends StatelessWidget {
  final ImageProvider image;
  final String label;
  const Playlists({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: image,
          width: 135,
          height: 135,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 14),
        )
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
