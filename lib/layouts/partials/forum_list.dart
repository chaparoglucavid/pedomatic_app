import 'package:flutter/material.dart';
import 'package:pedomatic_app/widgets/general_widgets/forum_card_element.dart';

class ForumList extends StatefulWidget {
  const ForumList({super.key});

  @override
  State<ForumList> createState() => _ForumListState();
}

class _ForumListState extends State<ForumList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ForumCardElement(),
        childCount: 10,
      ),
    );
  }
}
