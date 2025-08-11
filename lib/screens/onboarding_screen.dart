import 'package:calley_app/screens/dashboard_screen.dart';
import 'package:calley_app/screens/login_screen.dart';
import 'package:calley_app/widgets/custom_button.dart';
import 'package:calley_app/widgets/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final videoUrl = "https://www.youtube.com/watch?v=g4Hbz2jLxvQ";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        // mute: false,
        enableCaption: false,
      ),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      bottomNavigationBar: customCallingNavBar(
        MediaQuery.of(context).size.width * .7,
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          profileCard("Hello $username", "Calley Personal"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 11),
                      Text(
                        "If you are here for the first time then ensure that",
                        style: TextStyle(color: whiteShadeColor),
                      ),
                      Text(
                        "you have uploaded the list to call from calley Web",
                        style: TextStyle(color: whiteShadeColor),
                      ),
                      Text(
                        "Panel hosted on https://app.getcalley.com",
                        style: TextStyle(color: whiteShadeColor),
                      ),
                    ],
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      // height: 220,
                      // width: 310,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,

                        onReady: () {
                          debugPrint("Ready");
                          // _controller.addListener(listener);
                        },
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(isExpanded: true),
                          // FullScreenButton(),
                        ],
                      ),
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
