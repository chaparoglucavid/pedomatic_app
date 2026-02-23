import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/profile_app_bar.dart';
import 'package:pedomatic_app/widgets/buttons/balance_history_button.dart';
import 'package:pedomatic_app/widgets/buttons/logout_button.dart';
import 'package:pedomatic_app/widgets/buttons/order_history_button.dart';
import 'package:pedomatic_app/widgets/buttons/profile_settings_button.dart';
import 'package:pedomatic_app/widgets/buttons/profile_subscriptions_button.dart';
import 'package:pedomatic_app/widgets/buttons/support_contact_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        ProfileAppBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ProfileSubscriptionsButton(),
        ProfileSettingsButton(),
        OrderHistoryButton(),
        BalanceHistoryButton(),
        SupportContactButton(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LogoutButton(),
            ),
          ),
        ),
      ],
    );
  }
}
