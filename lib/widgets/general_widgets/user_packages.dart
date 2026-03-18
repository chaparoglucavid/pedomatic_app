import 'package:flutter/material.dart';
import 'package:pedomatic_app/model/package_model.dart';
import 'package:pedomatic_app/screens/user/packages_screen.dart';
import 'package:pedomatic_app/services/api_service.dart';

class UserPackages extends StatefulWidget {
  const UserPackages({super.key});

  @override
  State<UserPackages> createState() => _UserPackagesState();
}

class _UserPackagesState extends State<UserPackages> {
  final api = ApiService();
  List<PackageModel> packages = [];

  void loadPackages() async {
    final response = await api.getPackages();
    final data = response.map((json) => PackageModel.fromJson(json)).toList();
    data.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    setState(() {
      packages = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadPackages();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Abunə paketləri",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PackagesScreen()),
                    );
                  },
                  child: const Text(
                    "Hamısı",
                    style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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
            height: 400,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: packages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 20),
              itemBuilder: (_, i) => _PackageCard(packages[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final PackageModel p;
  const _PackageCard(this.p);

  @override
  Widget build(BuildContext context) {
    final bool isPopular = p.isPopular;
    final String badge = p.badgeText.isNotEmpty ? p.badgeText : (isPopular ? "MƏŞHUR" : "");

    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: isPopular ? Colors.indigo : Colors.grey.shade200,
          width: isPopular ? 2.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isPopular 
              ? Colors.indigo.withOpacity(0.12) 
              : Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (badge.isNotEmpty)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(0, -12),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: isPopular ? Colors.indigo : Colors.black87,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: (isPopular ? Colors.indigo : Colors.black).withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      badge.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isPopular ? Colors.indigo.withOpacity(0.1) : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.auto_awesome_outlined,
                        color: isPopular ? Colors.indigo : Colors.grey,
                        size: 24,
                      ),
                    ),
                    if (isPopular)
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 24),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  p.packageTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  p.packageDescription,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 13,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      p.packagePrice,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "AZN",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "/ ${p.packageValidityDays} gün",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(height: 1),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: p.features.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, idx) => Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          size: 16,
                          color: isPopular ? Colors.indigo : Colors.indigo.shade200,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "${p.features[idx].name} ${p.features[idx].value.isNotEmpty ? '— ${p.features[idx].value}' : ''}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPopular ? Colors.indigo : Colors.black,
                      foregroundColor: Colors.white,
                      elevation: isPopular ? 8 : 0,
                      shadowColor: Colors.indigo.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Abunə ol",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}