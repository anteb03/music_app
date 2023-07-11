import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

class AlbumSongs4 extends StatefulWidget {
  const AlbumSongs4({super.key});

  @override
  State<AlbumSongs4> createState() => _AlbumSongs4State();
}

class _AlbumSongs4State extends State<AlbumSongs4> {
  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }
  }

  late AudioPlayer _audioPlayer;

  final _playlst = ConcatenatingAudioSource(children: [
    AudioSource.uri(
      Uri.parse("asset:///songs/suncemoje.mp3"),
      tag: MediaItem(
        id: '1',
        artist: 'Sinan Sakić',
        album: "Pijem na eks",
        title: "Sunce moje",
        artUri: Uri.parse(
            "https://i1.sndcdn.com/artworks-8d93eabd-30a5-4ea4-9ed9-6ba78ea5770d-0-t500x500.jpg"),
      ),
    ),
    AudioSource.uri(
      Uri.parse("asset:///songs/pijemnaeks.mp3"),
      tag: MediaItem(
        id: '2',
        artist: 'Sinan Sakić',
        album: "Pijem na eks",
        title: "Pijem na eks",
        artUri: Uri.parse(
            "https://i1.sndcdn.com/artworks-8d93eabd-30a5-4ea4-9ed9-6ba78ea5770d-0-t500x500.jpg"),
      ),
    ),
  ]);

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
    _audioPlayer = audioPlayer;
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playlst);
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
                      child: StreamBuilder<SequenceState?>(
                          stream: _audioPlayer.sequenceStateStream,
                          builder: (context, snapshot) {
                            final state = snapshot.data;
                            if (state?.sequence.isEmpty ?? true) {
                              return SizedBox();
                            }
                            final metadata =
                                state!.currentSource!.tag as MediaItem;
                            return MediaMetaData2(
                              imageUrl: metadata.artUri.toString(),
                            );
                          }),
                    )),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            child: Column(children: [
                              SizedBox(
                                height: 10,
                              ),
                              StreamBuilder<SequenceState?>(
                                  stream: _audioPlayer.sequenceStateStream,
                                  builder: (context, snapshot) {
                                    final state = snapshot.data;
                                    if (state?.sequence.isEmpty ?? true) {
                                      return SizedBox();
                                    }
                                    final metadata =
                                        state!.currentSource!.tag as MediaItem;
                                    return MediaMetaData(
                                      artist: metadata.artist ?? '',
                                      title: metadata.title,
                                    );
                                  }),
                              SizedBox(
                                height: 20,
                              ),
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
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        onPressed: audioPlayer.seekToPrevious,
        icon: Icon(
          Icons.skip_previous_rounded,
        ),
        color: Colors.grey,
        iconSize: 50,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
      StreamBuilder<PlayerState>(
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
      ),
      IconButton(
        onPressed: audioPlayer.seekToNext,
        icon: Icon(Icons.skip_next_rounded),
        color: Colors.grey,
        iconSize: 50,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
      )
    ]);
  }
}

class PositionData {
  const PositionData(this.position, this.bufferedPosition, this.duration);
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class MediaMetaData extends StatelessWidget {
  const MediaMetaData({super.key, required this.title, required this.artist});

  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 20)),
        SizedBox(
          height: 5,
        ),
        Text(artist, style: TextStyle(color: Colors.grey, fontSize: 18))
      ],
    );
  }
}

class MediaMetaData2 extends StatelessWidget {
  const MediaMetaData2({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
