import 'package:flutter/cupertino.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Text("Səhifə tapılmadı.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            ),
          )
        ]
    );
  }
}
