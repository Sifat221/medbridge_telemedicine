import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../profile/screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.isRegistered<AuthController>()
        ? Get.find<AuthController>()
        : Get.put(AuthController());

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        AssetImage("assets/icons/user14.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// PROFILE CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Row(
                      children: [

                        /// IMAGE
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage:
                              AssetImage("assets/images/doctor14.png"),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Color(0xff2D5BFF),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.camera_alt,
                                    size: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(width: 12),

                        /// INFO
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: const [
                              Text("Dr. Julian Sterling",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.bold)),
                              SizedBox(height: 4),
                              Text("SPECIALIST DOCTOR",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("ID NUMBER\nMED-9920-X",
                            style: TextStyle(fontSize: 12)),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EditProfileScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xff2D5BFF),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text("Edit Profile"),
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// SECTION BUILDER
              _section("PERSONAL INFORMATION", [
                _tile(Icons.person, "Bio & Expertise"),
                _tile(Icons.contact_page, "Contact Details"),
              ]),

              _section("ACCOUNT SETTINGS", [
                _tile(Icons.notifications, "Notification Preferences"),
                _tile(Icons.account_balance_wallet, "Payout Methods"),
              ]),

              _section("SECURITY", [
                _tile(Icons.security, "Password & 2FA"),
              ]),

              _section("HELP & SUPPORT", [
                _tile(Icons.help, "Help Center"),
                _tile(Icons.description, "Terms of Service"),
              ]),

              const SizedBox(height: 20),

              /// SIGN OUT
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    await authController.logout();
                  },
                  icon: const Icon(Icons.logout,
                      color: Colors.red),
                  label: const Text("SIGN OUT",
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        selectedItemColor: const Color(0xff2D5BFF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Doctors"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  /// SECTION
  Widget _section(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(children: children),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  /// TILE
  Widget _tile(IconData icon, String text) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, size: 18),
      ),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
    );
  }
}