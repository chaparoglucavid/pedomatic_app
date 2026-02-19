import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ForumCardElement extends StatelessWidget {
  const ForumCardElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.08),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.deepPurple.withOpacity(0.03)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                "Boğaz ağrısı yarana biləcək səbəblər",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              /// Description
              Text(
                "Duzlu su ilə qarqara etmək bakteriyaları azaltmağa kömək edə bilər və boğaz ağrısını yüngülləşdirə bilər.",
                style: TextStyle(color: Colors.grey[700], height: 1.4),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 16),

              /// Bottom Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _iconButton(
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedOkFinger,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        14
                      ),
                      _iconButton(
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedComment01,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        20
                      ),
                      _iconButton(
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedShare01,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        6
                      ),
                    ],
                  ),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {},
                    label: const Text("Ətraflı"),
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowRight01,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton(HugeIcon icon, int count) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.06),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              icon,
              SizedBox(width: 2,),
              Text(count.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)
            ],
          ),
        ),
      ),
    );
  }
}
