import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          /// FAKE VIDEO BACKGROUND
          Positioned.fill(
            child: Container(
              color: Colors.black87,
              child: const Center(
                child: Text(
                  "Connecting...",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          /// TOP INFO
          const Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Dr. Sarah Jenkins",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "00:12",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          /// BOTTOM CONTROLS
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                _circleBtn(Icons.mic),
                _circleBtn(Icons.videocam),

                /// END CALL
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.call_end, color: Colors.white),
                ),

                _circleBtn(Icons.volume_up),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleBtn(IconData icon) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.white24,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}