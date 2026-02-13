import 'package:flutter/cupertino.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/equipment_list.dart';
import 'package:pedomatic_app/layouts/partials/home_sliver_app_bar.dart';
import 'package:pedomatic_app/widgets/general_widgets/home_page_ads_banner.dart';
import 'package:pedomatic_app/widgets/general_widgets/home_page_stories_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
        slivers: [
          HomeSliverAppBar(),
          HomePageStoriesSection(),
          HomePageAdsBanner(),
          EquipmentList()
        ],
    );
  }
}
