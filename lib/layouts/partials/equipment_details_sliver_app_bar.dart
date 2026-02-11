import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipmentDetailsSliverAppBar extends StatefulWidget {
  const EquipmentDetailsSliverAppBar({super.key});

  @override
  State<EquipmentDetailsSliverAppBar> createState() => _EquipmentDetailsSliverAppBarState();
}

class _EquipmentDetailsSliverAppBarState extends State<EquipmentDetailsSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 240.0,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.blurBackground, StretchMode.zoomBackground],
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6200EE),
                Colors.pinkAccent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset('assets/images/equipment.png'),
                ),
                SizedBox(height: 1,),
                Text("Equipment #000001", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                Text("Equipment address will be displayed in here", style: TextStyle(color: Colors.white, fontSize: 10),)
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
