import 'package:flutter/material.dart';
import 'package:pedomatic_app/model/package_model.dart';
import 'package:pedomatic_app/services/api_service.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  final api = ApiService();
  List<PackageModel> packages = [];
  bool isLoading = true;

  void loadPackages() async {
    setState(() => isLoading = true);

    try {
      final response = await api.getPackages();

      final data = response
          .map((json) => PackageModel.fromJson(json))
          .toList();

      data.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

      if (!mounted) return;

      setState(() {
        packages = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Paketlər yüklənərkən xəta baş verdi"),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Abunəlik Paketləri",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : packages.isEmpty
              ? const Center(child: Text("Hələ ki, heç bir paket yoxdur"))
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            const Text(
                              "Sənə uyğun planı seç",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Hər bir paket istifadəçilərimizin ehtiyaclarına uyğun olaraq xüsusi hazırlanmışdır.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Using a vertical list of pricing cards for a more "standard" pricing page feel on mobile
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: packages.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 24),
                        itemBuilder: (_, i) => _PackagesScreenCard(packages[i]),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "İstənilən vaxt abunəliyi ləğv edə bilərsiniz.",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class _PackagesScreenCard extends StatelessWidget {
  final PackageModel p;

  const _PackagesScreenCard(this.p);

  @override
  Widget build(BuildContext context) {
    final bool isPopular = p.isPopular;
    final String badge = p.badgeText.isNotEmpty ? p.badgeText : (isPopular ? "MƏŞHUR" : "");

    return Container(
      width: double.infinity,
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
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (badge.isNotEmpty)
            Positioned(
              top: -12,
              left: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isPopular ? Colors.indigo : Colors.black87,
                  borderRadius: BorderRadius.circular(100),
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
          
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      p.packageTitle,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                    if (isPopular)
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 28),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  p.packageDescription,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      p.packagePrice,
                      style: const TextStyle(
                        fontSize: 36,
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
                const SizedBox(height: 20),
                ...p.features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        size: 18,
                        color: isPopular ? Colors.indigo : Colors.indigo.shade200,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "${f.name} ${f.value.isNotEmpty ? '— ${f.value}' : ''}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPopular ? Colors.indigo : Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      elevation: isPopular ? 8 : 0,
                      shadowColor: Colors.indigo.withOpacity(0.5),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "İndi abunə ol",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
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
