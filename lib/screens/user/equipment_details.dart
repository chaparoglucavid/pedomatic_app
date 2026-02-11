import 'package:flutter/cupertino.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';
import 'package:pedomatic_app/layouts/partials/equipment_details_sliver_app_bar.dart';

class EquipmentDetails extends StatefulWidget {
  const EquipmentDetails({super.key});

  @override
  State<EquipmentDetails> createState() => _EquipmentDetailsState();
}

class _EquipmentDetailsState extends State<EquipmentDetails> {
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
        slivers: [
            EquipmentDetailsSliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Column(
                    children: [
                      Text("Kateqoriyalar", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 120,
                            child: Image.asset('assets/images/categories/item1.png'),
                          ),
                        ],
                      )
                    ],
                  ),
              ),
            )
        ]
    );
  }
}
