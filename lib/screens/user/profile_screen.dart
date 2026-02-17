import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pedomatic_app/layouts/master_layout.dart';

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
        SliverAppBar(pinned: true, title: const Text("Profil")),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  child: Icon(Icons.person, size: 40),
                ),
                const SizedBox(height: 12),
                const Text(
                  "İstifadəçi Adı",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  "user@example.com",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Card(
                          elevation: 6,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange.shade100,
                                  child: HugeIcon(
                                    icon: HugeIcons.strokeRoundedShoppingBag01,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "55",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      "Ümumi sifariş",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Card(
                          elevation: 6,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade100,
                                  child: HugeIcon(
                                    icon: HugeIcons.strokeRoundedHeartCheck,
                                    color: Colors.purple,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "55",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      "Ümumi sifariş",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Card(
                          elevation: 6,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange.shade100,
                                  child: HugeIcon(icon: HugeIcons.strokeRoundedShoppingBag01, color: Colors.deepOrange),
                                ),
                                SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("55", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),),
                                    Text("Ümumi sifariş", style: TextStyle(fontSize: 14, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Card(
                          elevation: 6,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue.shade100,
                                  child: HugeIcon(icon: HugeIcons.strokeRoundedHeartCheck, color: Colors.purple,),
                                ),
                                SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("55", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),),
                                    Text("Ümumi sifariş", style: TextStyle(fontSize: 14, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
