import 'package:flutter/material.dart';

class UserPackages extends StatelessWidget {
  const UserPackages({super.key});

  @override
  Widget build(BuildContext context) {
    final packages = [
      Package(
        title: "Standard",
        content: "Aylıq 20 ped",
        price: "4.99 AZN",
        color: Colors.blue,
      ),
      Package(
        title: "Premium",
        content: "Aylıq 40 ped + endirimlər",
        price: "8.99 AZN",
        color: Colors.pink,
        popular: true,
      ),
      Package(
        title: "VIP",
        content: "Limitsiz ped + xüsusi kampaniyalar",
        price: "14.99 AZN",
        color: Colors.deepPurple,
      ),
    ];

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Abunə paketləri",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Sənin üçün ən uyğun planı seç.",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 250,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: packages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, i) => _PackageCard(packages[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final Package p;

  const _PackageCard(this.p);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [
            p.color.withOpacity(0.15),
            p.color.withOpacity(0.35),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (p.popular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "⭐ Ən çox seçilən",
                style: TextStyle(
                  fontSize: 11,
                  color: p.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          const SizedBox(height: 10),

          Text(
            p.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: p.color,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            p.content,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 14,
            ),
          ),

          const Spacer(),

          Text(
            p.price,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: p.color,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: p.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: const Text(
                "Abunə ol",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Package {
  final String title;
  final String content;
  final String price;
  final Color color;
  final bool popular;

  Package({
    required this.title,
    required this.content,
    required this.price,
    required this.color,
    this.popular = false,
  });
}
