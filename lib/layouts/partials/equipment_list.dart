import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedomatic_app/model/equipments_model.dart';
import 'package:pedomatic_app/repositories/equipment_repository.dart';
import 'package:pedomatic_app/widgets/general_widgets/equipment_card_element.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({super.key});

  @override
  State<EquipmentList> createState() => _EquipmentListState();
}


class _EquipmentListState extends State<EquipmentList> {
  final repository = EquipmentRepository();
  List<EquipmentsModel> equipments = [];

  void loadEquipments() async {
    final data = await repository.fetchEquipments();
    setState(() {
      equipments = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadEquipments();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final eq = equipments[index];
        debugPrint(eq.toString());
        return EquipmentCardElement(equipment: eq);
      }, childCount: equipments.length),
    );
  }
}

