import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileSubscriptionsButton extends StatefulWidget {
  const ProfileSubscriptionsButton({super.key});

  @override
  State<ProfileSubscriptionsButton> createState() => _ProfileSubscriptionsButtonState();
}

class _ProfileSubscriptionsButtonState extends State<ProfileSubscriptionsButton> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 6)
                )
              ]
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14)
              ),
              child: HugeIcon(icon: HugeIcons.strokeRoundedTicket01),
            ),
            title: const Text(
              "Abunəlik",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Standart, Populyar, Premium paketlər",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        )
    );
  }
}
