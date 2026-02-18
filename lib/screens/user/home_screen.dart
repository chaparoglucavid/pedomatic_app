import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/equipment_list.dart';
import 'package:pedomatic_app/layouts/partials/home_sliver_app_bar.dart';
import 'package:pedomatic_app/layouts/partials/steps_and_energy_section.dart';
import 'package:pedomatic_app/widgets/general_widgets/home_page_ads_banner.dart';
import 'package:pedomatic_app/widgets/general_widgets/home_page_stories_section.dart';
import 'package:pedomatic_app/widgets/general_widgets/near_you_banner.dart';
import 'package:pedomatic_app/widgets/general_widgets/user_packages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
        slivers: [
          HomeSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sənin üçün tövsiyələr",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Məqalə və kampaniyalar ilə məlumatlan.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          HomePageStoriesSection(),
          NearYouBanner(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Günün xülasəsi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Bugünkü addım və kalori statistikanı izləyin.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          StepsAndEnergySection(),

          HomePageAdsBanner(),

          UserPackages(),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pedomatlar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Cihazlar ərazi üzrə sıralanıb.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          EquipmentList()
        ],
    );
  }
}
