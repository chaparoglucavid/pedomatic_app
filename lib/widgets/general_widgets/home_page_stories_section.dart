import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageStoriesSection extends StatefulWidget {
  const HomePageStoriesSection({super.key});

  @override
  State<HomePageStoriesSection> createState() => _HomePageStoriesSectionState();
}

class _HomePageStoriesSectionState extends State<HomePageStoriesSection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12, width: 3)
                  ),
                  child: Image.asset('assets/images/uni.webp'),
                ),
                const SizedBox(height: 6),
                const Text(
                  "ADA",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
            ;
          },
        ),
      ),
    );
  }
}
