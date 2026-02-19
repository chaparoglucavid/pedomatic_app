import 'package:flutter/material.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/forum_list.dart';
import 'package:pedomatic_app/layouts/partials/forum_sliver_app_bar.dart';
import 'package:pedomatic_app/widgets/general_widgets/forum_add_button.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      slivers: [
        ForumSliverAppBar(),
        ForumAddButton(),
        ForumList()
      ],
    );
  }
}
