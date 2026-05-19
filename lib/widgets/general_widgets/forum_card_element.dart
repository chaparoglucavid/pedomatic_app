import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ForumCardElement extends StatelessWidget {
  final dynamic forum;
  const ForumCardElement({super.key, required this.forum});

  @override
  Widget build(BuildContext context) {
    final String subject = forum['forum_subject'] ?? 'Mövzu yoxdur';
    final String content = forum['forum_content'] ?? 'Məzmun yoxdur';
    final int commentCount = forum['forum_comments'] != null ? (forum['forum_comments'] as List).length : 0;
    final String userName = forum['user'] != null ? forum['user']['name'] : 'Naməlum';

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
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.deepPurple.withOpacity(0.1),
                    child: Text(userName[0].toUpperCase(), style: const TextStyle(fontSize: 12, color: Colors.deepPurple)),
                  ),
                  const SizedBox(width: 8),
                  Text(userName, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
              const SizedBox(height: 8),
              /// Title
              Text(
                subject,
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
                content,
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
                        0
                      ),
                      _iconButton(
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedComment01,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        commentCount
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
                    onPressed: () {
                      // Navigate to Forum Details (not implemented yet)
                    },
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
              const SizedBox(width: 2,),
              Text(count.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),)
            ],
          ),
        ),
      ),
    );
  }
}
