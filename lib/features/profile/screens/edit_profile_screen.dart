import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/controllers/auth_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final AuthController authController = Get.isRegistered<AuthController>()
      ? Get.find<AuthController>()
      : Get.put(AuthController());

  /// 🔥 STATES
  bool isNotificationOn = true;
  bool isDarkMode = false;
  String selectedLanguage = "English";

  ImageProvider profileImage =
  const AssetImage("assets/icons/user15.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      isDarkMode ? Colors.black : const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back,
                        color:
                        isDarkMode ? Colors.white : Colors.black),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// PROFILE IMAGE
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: profileImage,
                    ),

                    /// CAMERA BUTTON
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            profileImage = const AssetImage(
                                "assets/images/doctor15.png");
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xff2D5BFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt,
                              size: 14, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// FORM
              _field("Full Name", "Dr. Julian Sterling"),
              _field("Email", "julian@mail.com"),
              _field("Phone", "+880123456789"),
              _field("Specialization", "Cardiologist"),

              const SizedBox(height: 20),

              /// SETTINGS
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.grey[900]
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [

                    /// NOTIFICATION
                    SwitchListTile(
                      title: Text("Notifications",
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black)),
                      value: isNotificationOn,
                      onChanged: (val) {
                        setState(() => isNotificationOn = val);
                      },
                    ),

                    /// DARK MODE
                    SwitchListTile(
                      title: Text("Dark Mode",
                          style: TextStyle(
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black)),
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() => isDarkMode = val);
                      },
                    ),

                    /// LANGUAGE
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Language",
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black)),
                        DropdownButton<String>(
                          value: selectedLanguage,
                          dropdownColor: isDarkMode
                              ? Colors.grey[900]
                              : Colors.white,
                          items: ["English", "Bangla"]
                              .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                              .toList(),
                          onChanged: (val) {
                            setState(
                                    () => selectedLanguage = val!);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Save Changes"),
                ),
              ),

              const SizedBox(height: 20),

              /// LOGOUT
              Center(
                child:TextButton.icon(
                  onPressed: () async {
                    await authController.logout();
                  },
                  icon: const Icon(Icons.logout,
                      color: Colors.red),
                  label: const Text("LOGOUT",
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// TEXT FIELD
  Widget _field(String title, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 5),
          TextField(
            style: TextStyle(
                color: isDarkMode
                    ? Colors.white
                    : Colors.black),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: isDarkMode
                      ? Colors.white54
                      : Colors.grey),
              filled: true,
              fillColor: isDarkMode
                  ? Colors.grey[900]
                  : Colors.white,
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}