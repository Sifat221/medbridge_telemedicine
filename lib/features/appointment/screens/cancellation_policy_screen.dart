import 'package:flutter/material.dart';

class CancellationPolicyScreen extends StatelessWidget {
  const CancellationPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Cancellation Policy",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff2D5BFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.policy, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Please review our cancellation guidelines carefully.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// RULES
            _policyItem(
              icon: Icons.schedule,
              title: "24 Hours Cancellation",
              desc:
              "Appointments can be cancelled up to 24 hours in advance without any charges.",
            ),

            _policyItem(
              icon: Icons.warning,
              title: "Late Cancellation",
              desc:
              "Cancellations made within 24 hours may incur a small fee.",
            ),

            _policyItem(
              icon: Icons.cancel,
              title: "No Show Policy",
              desc:
              "Missing your appointment without notice may affect future bookings.",
            ),

            _policyItem(
              icon: Icons.health_and_safety,
              title: "Emergency Exception",
              desc:
              "Emergency cancellations are exempt from penalties.",
            ),

            _policyItem(
              icon: Icons.support_agent,
              title: "Need Help?",
              desc:
              "Please contact support if you have any issues or disputes.",
            ),

            const SizedBox(height: 20),

            /// FOOTER NOTE
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "By continuing to use our service, you agree to these terms.",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// POLICY ITEM WIDGET
  Widget _policyItem({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff2D5BFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xff2D5BFF)),
          ),

          const SizedBox(width: 10),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}