import 'package:flutter/material.dart';

class NearYouBanner extends StatelessWidget {
  const NearYouBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.blue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Ən yaxın pedomatlar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/map-screen');
                    },
                    icon: const Icon(
                      color: Colors.white,
                      Icons.map_outlined,
                      size: 18,
                    ),
                    label: const Text(
                      "Xəritəyə bax",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
