import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ✅ ADD THESE IMPORTS
import '../../call/screens/video_call_screen.dart';
import '../../call/screens/audio_call_screen.dart';
import '../../chat/screens/file_share_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        "text": _controller.text,
        "time": "Now",
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Column(
          children: [

            /// 🔝 HEADER (UNCHANGED)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 10),

                  const CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/doctor7.png"),
                  ),
                  const SizedBox(width: 10),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dr. Sarah Mitchell",
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                      Text("ONLINE NOW",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12)),
                    ],
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => const VideoCallScreen());
                    },
                    child: const Icon(Icons.videocam_outlined),
                  ),

                  const SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AudioCallScreen());
                    },
                    child: const Icon(Icons.call_outlined),
                  ),
                ],
              ),
            ),

            /// TODAY
            const Text("TODAY",
                style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 10),

            /// 💬 CHAT BODY
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [

                  /// OLD STATIC (UNCHANGED)
                  _doctorMsg(
                    "Hello Alex, I've just reviewed your lab results from yesterday. Everything looks stable, but I'd like to adjust your vitamin D dosage slightly.",
                    "09:41 AM",
                  ),

                  const SizedBox(height: 15),

                  _userMsg(
                    "That sounds good, Doctor. Should I start the new dosage immediately or finish the current bottle first?",
                    "09:43 AM",
                  ),

                  const SizedBox(height: 15),

                  _doctorFileMsg(),

                  const SizedBox(height: 20),

                  /// 🔥 NEW MESSAGES
                  ..._messages.map((msg) => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xff2D5BFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(msg["text"],
                            style: const TextStyle(color: Colors.white)),
                      ),
                      Text(msg["time"],
                          style: const TextStyle(
                              fontSize: 10, color: Colors.grey)),
                    ],
                  )),

                  const SizedBox(height: 10),

                  const Text("DOCTOR IS TYPING...",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),

            /// 🔽 INPUT BAR (UPDATED ONLY + BUTTON)
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [

                  /// 🔥 + BUTTON (ADDED)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const FileShareScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Type your message...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xff2D5BFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.send,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// doctor msg
  Widget _doctorMsg(String text, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(text),
        ),
        const SizedBox(height: 5),
        Text(time,
            style: const TextStyle(
                fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  /// user msg
  Widget _userMsg(String text, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xff2D5BFF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(text,
              style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 5),
        Text(time,
            style: const TextStyle(
                fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  /// doctor file msg
  Widget _doctorFileMsg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                  "You can start tomorrow morning. I've attached the updated prescription here for your records."),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.picture_as_pdf,
                        color: Colors.red),
                    SizedBox(width: 8),
                    Text("Prescription_Mitchell.pdf"),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Text("09:45 AM",
            style: TextStyle(
                fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}