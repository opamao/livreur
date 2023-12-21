import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:livreur/themes/themes.dart';
import 'package:sizer/sizer.dart';

import '../commande.dart';

class VoirCommandeScreen extends StatefulWidget {
  const VoirCommandeScreen({super.key});

  @override
  State<VoirCommandeScreen> createState() => _VoirCommandeScreenState();
}

class _VoirCommandeScreenState extends State<VoirCommandeScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  bool valideCommande = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
          bottom: 10.w,
        ),
        decoration: BoxDecoration(
          color: colorWhite,
          border: Border(
            top: BorderSide(
              color: colorGrey,
              width: 2,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.w),
            topRight: Radius.circular(5.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Acceptation des commandes",
              style: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.normal,
                fontSize: 11.sp,
              ),
            ),
            Switch(
              value: valideCommande,
              activeColor: colorButton,
              onChanged: (bool value) {
                setState(() {
                  valideCommande = value;
                });
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fond1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: colorWhite,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Commandes",
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh_outlined,
                      color: colorWhite,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                border: Border.all(
                  width: 1,
                  color: colorGrey,
                ),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: colorPrimary,
                ),
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Nouveau (1)",
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "En traitement (2)",
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Envoyé",
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Tu as une nouvelle commande",
                        style: TextStyle(
                          color: colorBlack,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.sp,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 1,
                          separatorBuilder: (BuildContext context, int index) =>
                              Gap(1.h),
                          itemBuilder: (context, index) {
                            return Card(
                              surfaceTintColor: colorWhite,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: colorGrey.withOpacity(.3),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EtatCommandeScreen(),
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundColor: colorPrimary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1),
                                    // Border radius
                                    child: CircleAvatar(
                                      backgroundColor: colorWhite,
                                      child: const Icon(Icons.reorder_outlined),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "#QFRSF771230ML",
                                  style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                subtitle: Text(
                                  "A livrer - 27 Oct 11:54",
                                  style: TextStyle(
                                    color: colorGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.navigate_next_outlined,
                                  color: colorBlack,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text("It's rainy here"),
                  ),
                  const Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
