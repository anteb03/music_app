import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

class Song1 extends StatefulWidget {
  const Song1({super.key});

  @override
  State<Song1> createState() => _Song1State();
}

class _Song1State extends State<Song1> {
  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  void initState() {
    super.initState();
    var audioPlayer = AudioPlayer();
    _audioPlayer = audioPlayer..setAsset('songs/miljacka.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
                background: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.30),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.grey.withOpacity(.15),
                        Colors.grey.withOpacity(.4),
                        Colors.grey.withOpacity(.8),
                        Colors.grey.withOpacity(.4),
                        Colors.grey.withOpacity(.15),
                      ])),
                  child: Center(
                    child: Playlists(
                        image:
                            AssetImage('lib/albums_pictures/halidbeslic.jpg')),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: MediaQuery.of(context).size.height * 0.55,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 850,
                width: 450,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.grey.withOpacity(.15),
                      Colors.grey.withOpacity(0),
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(1),
                    ])),
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF30314D).withOpacity(.3),
                                Color(0xFF30314D).withOpacity(.4),
                                Color(0xFF30314D).withOpacity(.8),
                                Color(0xFF30314D).withOpacity(.4),
                                Color(0xFF30314D).withOpacity(.3),
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(45))),
                      child: Center(
                          child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Miljacka',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Halid Bešlić',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 300,
                            child: Column(children: [
                              StreamBuilder<PositionData>(
                                stream: _positionDataStream,
                                builder: (context, snapshot) {
                                  final positionData = snapshot.data;
                                  return ProgressBar(
                                    barHeight: 4,
                                    baseBarColor: Colors.black54,
                                    bufferedBarColor: Colors.black,
                                    progressBarColor: Colors.grey,
                                    thumbColor: Colors.grey,
                                    thumbGlowColor: Colors.transparent,
                                    timeLabelTextStyle: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    progress:
                                        positionData?.position ?? Duration.zero,
                                    total:
                                        positionData?.duration ?? Duration.zero,
                                    buffered: positionData?.bufferedPosition ??
                                        Duration.zero,
                                    onSeek: _audioPlayer.seek,
                                  );
                                },
                              ),
                              SizedBox(height: 5),
                              Controls(audioPlayer: _audioPlayer),
                              SizedBox(height: 10),
                            ]),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 350,
                      child: Text(
                        'More about song:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 350,
                      child: GestureDetector(
                        onTap: () {
                          openUrl('https://genius.com/albums/Halid-beslic/08');
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
                )),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

class Playlists extends StatelessWidget {
  final ImageProvider image;
  const Playlists({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: image,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
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

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: audioPlayer.play,
            icon: const Icon(Icons.play_circle_fill),
            color: Colors.grey,
            iconSize: 50,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: audioPlayer.pause,
            icon: const Icon(Icons.pause_circle_filled),
            color: Colors.grey,
            iconSize: 50,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
          );
        }
        return const Icon(
          Icons.play_circle_fill,
          size: 50,
          color: Colors.grey,
        );
      },
    );
  }
}

class PositionData {
  const PositionData(this.position, this.bufferedPosition, this.duration);
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}
