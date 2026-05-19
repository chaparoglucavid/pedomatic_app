import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:hive/hive.dart';
import 'package:pedomatic_app/services/api_service.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({super.key});
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xffFF5F6D),
            Color(0xffFFC371),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () => _confirmLogout(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        icon: const HugeIcon(
          icon: HugeIcons.strokeRoundedLogout01,
          color: Colors.white,
        ),
        label: const Text(
          "Hesabdan çıx",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Çıxış etmək istəyirsən?"),
        content: const Text("Hesabdan çıxış ediləcək."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ləğv et"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              final box = Hive.box('userInformations');
              final token = box.get('token');
              if (token != null) {
                try {
                  await api.logout(token);
                } catch (e) {
                  debugPrint("Logout error: $e");
                }
              }
              await box.delete('token');
              await box.delete('user');
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
            child: const Text("Çıxış"),
          )
        ],
      ),
    );
  }
}
