
import 'package:flutter/material.dart';
import 'package:temocare_flutter/screens/AppointmentDetail.dart';
class myAppointment extends StatelessWidget{
  const myAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    TabController? tabController;
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context);
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              bottom:  TabBar(
                controller: tabController,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.pink,
                indicatorColor: Colors.pink,
                tabs: const [
                  Tab(text: "Upcoming",),
                  Tab(text: "Completed",),
                  Tab(text: "Cancelled",),
                ],
              ),
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("My Appointments",style: TextStyle(
                    color: Colors.black
                  ),)
                ],
              ),
            ),
            body:const TabBarView(
              children: [
                UpComing(),
                UpComing(),
                UpComing(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class UpComing extends StatefulWidget{
  const UpComing({super.key});

  @override
  State<UpComing> createState()  => _UpComing();
}
class _UpComing extends State<UpComing>{
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
       physics: const BouncingScrollPhysics(),
       shrinkWrap: true,
       itemCount: 5,
       scrollDirection: Axis.vertical,
       itemBuilder: (BuildContext context,int index){
         return Padding(
           padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
           child: Container(
             width: double.infinity,
             height: 150,
             decoration: BoxDecoration(
               border: Border.all(color: Colors.grey),
               color: Colors.white,
               borderRadius: const BorderRadius.all(Radius.circular(20)),
             ),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(15),
                   child: Container(
                     height:100,
                     width: 65,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.black),
                         borderRadius: const BorderRadius.all(Radius.circular(10))
                     ),
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                       child: Image.asset("assests/images/iv_doctor.png"),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text("Doctor",style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                       ),),
                       const SizedBox(height: 5,),
                       Row(
                         children: [
                           const Text("Videocall - ",style: TextStyle(
                             fontSize: 16,
                             color: Colors.grey,
                             fontWeight: FontWeight.w400,
                           ),),
                           Container(
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.amber),
                                 borderRadius: BorderRadius.circular(5)
                             ),
                             child: const Padding(
                               padding: EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
                               child: Text(
                                 "Upcoming",
                                 style: TextStyle(
                                     color: Colors.amber,
                                     fontSize: 8,
                                     fontWeight: FontWeight.w500
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                       const SizedBox(height: 10,),
                       const Row(
                         children: [
                           Text("Dec 12, 2021   |   16:00 PM",style: TextStyle(
                             fontSize: 13,
                             color: Colors.grey,
                             fontWeight: FontWeight.w300,
                           ),),
                         ],
                       ),
                       Flexible(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 5,bottom: 5),
                           child: Row(
                             children: [
                               Container(
                                 width: 93,
                                 height: 33,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   border: Border.all(color: Colors.pink)
                                 ),
                                 child: const Center(
                                   child: Text("Cancel",style: TextStyle(
                                     color: Colors.pink,
                                     fontSize: 20,
                                     fontWeight: FontWeight.w400
                                   ),),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 15),
                                 child: GestureDetector(
                                   onTap: (){
                                     Navigator.push(context,MaterialPageRoute(builder: (context){
                                       return const AppointmentDetail();
                                     }));
                                   } ,
                                   child: Container(
                                     width: 93,
                                     height: 33,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         border: Border.all(color: Colors.pink),
                                       color: Colors.pink
                                     ),
                                     child: const Center(
                                       child: Text("Call",style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 20,
                                           fontWeight: FontWeight.w400
                                       ),),
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       )

                     ],
                   ),
                 )
                 /*Expanded(
                     child: Container(
                       child: Padding(
                         padding: const EdgeInsets.only(top: 15),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Doctor",style: TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.w500,
                             ),),
                             SizedBox(
                               height: 5,
                             ),
                             Expanded(child: Row(
                               children: [
                                 Text("Videocall - ",style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.grey,
                                   fontWeight: FontWeight.w400,
                                 ),),
                                 Container(
                                   decoration: BoxDecoration(
                                       border: Border.all(color: Colors.amber),
                                       borderRadius: BorderRadius.circular(5)
                                   ),
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
                                     child: Text(
                                       "Upcoming",
                                       style: TextStyle(
                                           color: Colors.amber,
                                           fontSize: 8,
                                           fontWeight: FontWeight.w500
                                       ),
                                     ),
                                   ),
                                 )
                               ],
                             )),
                             Expanded(child: Row(
                               children: [
                                 Text("Dec 12, 2021   |   16:00 PM",style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.grey,
                                   fontWeight: FontWeight.w300,
                                 ),),
                               ],
                             )),
                             Row(
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(5),
                                     border: Border.all(color: Colors.pink)
                                   ),
                                   child: Text("Cancel"),
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     ))*/
               ],
             ),
           ),
         );
       });
  }
}