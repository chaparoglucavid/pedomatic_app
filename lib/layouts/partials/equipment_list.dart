import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedomatic_app/model/equipments_model.dart';
import 'package:pedomatic_app/widgets/general_widgets/equipment_card_element.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({super.key});

  @override
  State<EquipmentList> createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(

          (context, index) {
            final equipment = equipmentData[index];
            return EquipmentCardElement(equipment: equipment);
          },
          childCount: equipmentData.length
      ),
    );
  }
}
