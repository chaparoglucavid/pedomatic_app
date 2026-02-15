import 'package:flutter/material.dart';

class UserPackages extends StatelessWidget {
  const UserPackages({super.key});

  @override
  Widget build(BuildContext context) {
    final packages = [
      Package(
        title: "Standard",
        content: "Aylıq 20 ped + basic AI analiz",
        price: "4.99 AZN",
      ),
      Package(
        title: "Premium",
        content: "Aylıq 40 ped + AI analiz + endirimlər",
        price: "8.99 AZN",
      ),
      Package(
        title: "VIP",
        content: "Limitsiz ped + xüsusi kampaniyalar",
        price: "14.99 AZN",
      ),
    ];

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Abunə paketləri",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Sənin üçün uyğun istifadə paketini seç.",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 230,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final p = packages[index];
                  final bool isPopular = p.title == "Premium";

                  // Fərqli paketlər üçün fərqli vurğu rəngi
                  Color accentColor;
                  switch (p.title) {
                    case "Standard":
                      accentColor = Colors.blueAccent;
                      break;
                    case "Premium":
                      accentColor = Colors.pinkAccent;
                      break;
                    case "VIP":
                      accentColor = Colors.deepPurple;
                      break;
                    default:
                      accentColor = Colors.pinkAccent;
                  }

                  return Container(
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: accentColor.withOpacity(isPopular ? 1 : 0.4),
                        width: isPopular ? 1.8 : 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.05),
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                p.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (isPopular)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: accentColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "Ən çox seçilən",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: accentColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            p.content,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            p.price,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: accentColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: accentColor,
                                side: BorderSide(
                                  color: accentColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Abunə ol"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Package {
  final String title;
  final String content;
  final String price;

  Package({
    required this.title,
    required this.content,
    required this.price,
  });
}
