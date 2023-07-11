import 'package:aplikacija1/albums_songs/album4.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Person3 extends StatefulWidget {
  const Person3({super.key});

  @override
  State<Person3> createState() => _Person3State();
}

class _Person3State extends State<Person3> {
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
                  'lib/persons_pictures/sinansakicc.jpg',
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
                            'Sinan Sakić',
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
                              'Sinan Sakić was a Serbian pop-folk singer(born on 13 October 1956). Sakić first reached massive popularity as a member of the Yugoslav turbo-folk band, Južni Vetar (Southern Wind). He also went on to have a successful career as a solo artist. Sakić was one of the most successful artists in the ex-Yugoslavia region.When Sakić was only 13 years old, he was a drummer for a folk band. Later on, he played with the bassist Bratislav Braca Dinkić. He was a drummer until 1984.'
                              'Sakić launched his singing career in 1978 with the singles, Sreli Smo Se Mnogo Kasno and Jedna Tuga Za Dva Druga. Died on 1 June 2018 (aged 61) ',
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
                                      child: Album4(),
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 250)));
                            },
                            child: Playlists(
                                label: 'Pijem na eks',
                                image: AssetImage(
                                  'lib/albums_pictures/sinansakic.jpg',
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
                                  'https://www.jutarnji.hr/tag/Sinan_Saki%C4%87');
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
