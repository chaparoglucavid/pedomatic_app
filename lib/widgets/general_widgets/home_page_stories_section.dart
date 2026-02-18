import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageStoriesSection extends StatefulWidget {
  const HomePageStoriesSection({super.key});

  @override
  State<HomePageStoriesSection> createState() =>
      _HomePageStoriesSectionState();
}

class _HomePageStoriesSectionState extends State<HomePageStoriesSection> {
  List<Stories> stories = [
    Stories(
      1,
      "Menstrual döngünü hesabla",
      "Pedomat app v asitəsi ilə döngülərin hesablanması süni intellekt köməyi ilə artıq daha asan",
      'https://konusmamizgerek.org/wp-content/uploads/2025/05/unnamed-1-819x1024.jpg',
    ),
    Stories(
      2,
      "Cibinizə qənaət edin",
      "Pedomat app vasitəsi ilə ped sifarişi edin və 35% endirimdən yararlanın!",
      'https://images.themagger.net/wp-content/uploads/2021/06/regyoksullugu.jpg',
    ),
    Stories(
      3,
      "Sağlıqlı arıqlama",
      "Pedomat app vasitəsi ilə sağlıqlı arıqlama yolları!",
      'https://www.buseterim.com.tr/upload/default/2019/8/16/reglolmak680.jpg',
    ),
    Stories(
      4,
      "m10 ilə ödəmə imkanı",
      "Pedomat app ödəniş üçün artıq m10 istifadə edə bilərsiniz!",
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSs5vsd5acAKu2mLVCn7GhKZmhpTsyUBHKCw&s',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(

      child: SizedBox(
        height: 165,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final story = stories[index];

            return SizedBox(
              width: 90,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        story.image ?? "",
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    story.title ?? "",
                    maxLines: 1,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Stories {
  int? id;
  String? title;
  String? content;
  String? image;

  Stories(this.id, this.title, this.content, this.image);
}
