import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  int seconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        seconds++;
      });
    });
  }

  String get time {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return "00:${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND
          SizedBox.expand(
            child: Image.asset(
              "assets/images/doctor2.png",
              fit: BoxFit.cover,
            ),
          ),

          /// TOP BAR
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  _topChip(time),
                  _topChip("🔒 ENCRYPTED"),

                  const Icon(Icons.settings, color: Colors.white)
                ],
              ),
            ),
          ),

          /// SMALL PREVIEW
          Positioned(
            top: 100,
            right: 20,
            child: Stack(
              children: [
                Container(
                  width: 90,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/user.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// YOU TAG
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("You",
                        style: TextStyle(
                            color: Colors.white, fontSize: 10)),
                  ),
                )
              ],
            ),
          ),

          /// DOCTOR INFO
          Positioned(
            bottom: 140,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Sarah Mitchell",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Senior Cardiologist • MedSanctuary",
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),

          /// CONTROLS
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                _circleBtn(Icons.mic, () {
                  print("Mic clicked");
                }),

                _circleBtn(Icons.videocam, () {
                  print("Camera toggled");
                }),

                /// END CALL
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.call_end,
                        color: Colors.white),
                  ),
                ),

                _circleBtn(Icons.flip_camera_android, () {
                  print("Switch camera");
                }),

                _circleBtn(Icons.more_vert, () {
                  print("More options");
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// TOP CHIP
  Widget _topChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: const TextStyle(color: Colors.white)),
    );
  }

  /// BUTTON
  Widget _circleBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}