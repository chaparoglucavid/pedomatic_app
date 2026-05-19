import 'package:flutter/material.dart';
import 'package:pedomatic_app/services/api_service.dart';
import 'package:pedomatic_app/widgets/general_widgets/forum_card_element.dart';

class ForumList extends StatefulWidget {
  const ForumList({super.key});

  @override
  State<ForumList> createState() => ForumListState();
}

class ForumListState extends State<ForumList> {
  final ApiService _api = ApiService();
  List<dynamic> _forums = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadForums();
  }

  Future<void> loadForums() async {
    try {
      setState(() => _isLoading = true);
      final response = await _api.getForums();
      setState(() {
        _forums = response;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint("Forum yukleme xetasi: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SliverToBoxAdapter(
        child: Center(child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        )),
      );
    }

    if (_forums.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text("Forumda hələ heç bir mövzu yoxdur."),
        )),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ForumCardElement(forum: _forums[index]),
        childCount: _forums.length,
      ),
    );
  }
}
