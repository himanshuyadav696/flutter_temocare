import 'package:flutter/material.dart';
class myAppointment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TabController? _tabController;
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
          child: Scaffold(
            body:  SafeArea(
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.pink,
                    indicatorColor: Colors.pink,
                    tabs: [
                      Tab(text: "Upcoming",),
                      Tab(text: "Completed",),
                      Tab(text: "Cancelled",),
                    ],
                  ),
                  TabBarView(
                    children: [
                     Text("Upcoming"),
                      Text("Completed"),
                      Text("Cancelled"),
                    ],
                  ),
                ],
              ),
            ),
          )
      )
    );
  }
}