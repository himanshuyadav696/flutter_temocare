import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Models/DoctorData.dart';
import 'ScheduleScreen.dart';

class DoctorDetail extends StatefulWidget{
  final DoctorData doctorData;
  DoctorDetail({required this.doctorData} );
  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  late DoctorData showDoctorData;
  @override
  void initState() {
    showDoctorData = widget.doctorData;
  }
  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     body:SingleChildScrollView(
       child: Column(
         children: [
           Stack(
               children:[
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       width: double.infinity,
                       color: HexColor("#F2A56F"),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               InkWell(
                                 child: SvgPicture.asset("assests/images/backbutton.svg"),
                                 onTap: (){
                                   Navigator.pop(context);
                                 },
                               ),
                               Expanded(
                                 child: Text(
                                   "Doctor Detail",style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 20,
                                   fontWeight: FontWeight.w500
                                 ),
                                   textAlign: TextAlign.center,
                                 ),
                               ),
                               SizedBox(
                                 width: 58,
                                 height: 58,
                               )
                               ],
                           ),
                         ],
                       ),
                     ),
                     Container(
                       width: double.infinity,
                       height: 380,
                       decoration: BoxDecoration(
                         color: HexColor("#F2A56F"),
                         borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30)),
                       ),
                       child: Padding(
                         padding: EdgeInsets.only(top: 30,bottom: 50,right: 150),
                         child: Container(
                           decoration: BoxDecoration(
                             color: Colors.black12,
                             borderRadius: BorderRadius.only(topRight:Radius.circular(30),bottomRight: Radius.circular(30)),
                           ),
                           child: Padding(
                             padding:  EdgeInsets.only(left: 20,right: 16,bottom: 16,top: 30),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(showDoctorData.doctorName,
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 18,
                                     fontWeight: FontWeight.w600
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Text(showDoctorData.specialization,
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w400
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Card(
                                         color: Colors.white24,
                                         child: Padding(padding: EdgeInsets.all(5),
                                         child: SvgPicture.asset("assests/images/patient.svg")),
                                       ),
                                       SizedBox(
                                         width: 15,
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(top: 5),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Patient",
                                               style: TextStyle(
                                                 color: Colors.white,
                                                 fontSize: 14,
                                                 fontWeight: FontWeight.w400
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(top: 3),
                                               child: Text(showDoctorData.successfull_patients,
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.w600
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Card(
                                         color: Colors.white24,
                                         child: Padding(padding: EdgeInsets.all(5),
                                             child: SvgPicture.asset("assests/images/patient.svg")),
                                       ),
                                       SizedBox(
                                         width: 15,
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(top: 5),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Experience",
                                               style: TextStyle(
                                                   color: Colors.white,
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.w400
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(top: 3),
                                               child: Text("${showDoctorData.experience} Years",
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.w600
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(top: 10.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Card(
                                         color: Colors.white24,
                                         child: Padding(padding: EdgeInsets.all(5),
                                             child: SvgPicture.asset("assests/images/patient.svg")),
                                       ),
                                       SizedBox(
                                         width: 15,
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(top: 5),
                                         child: Column(
                                           children: [
                                             Text("Fees",
                                               style: TextStyle(
                                                   color: Colors.white,
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.w400
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(top: 3),
                                               child: Text("\$ ${showDoctorData.fees}",
                                                 style: TextStyle(
                                                     color: Colors.white,
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.w600
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:
                         [
                           Text("About",
                           style: TextStyle(
                               color: Colors.black,
                               fontSize: 25,
                               fontWeight: FontWeight.w600
                           ),),
                           Row(
                             children: [
                               SvgPicture.asset("assests/images/star.svg"),
                               Text(showDoctorData.rating,style: TextStyle(
                                   color: Colors.black,
                                 fontSize: 14,
                                 fontWeight: FontWeight.w500
                               ),),
                               Text("(${showDoctorData.reviews} Reviews)",style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w300
                               ),)
                             ],
                           )
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                       child: Text(
                         "Dr. Amin is a member of the American Association of Neurological Surgeons, the Congress of Neurological Surgeons, AANS/CNS Joint Section on Disorders of the Spine and Peripheral Nerves, and the North American Spine Society.",
                         style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.w400,
                           height: 1.5
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(top: 40,left: 20,right: 20),
                       child: ElevatedButton(onPressed: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context){
                           return ScheduleScreen();
                         }));
                       },
                         style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.pink),
                             shape: MaterialStateProperty.all(RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                             ))
                         ),
                         child: Container(
                           alignment: Alignment.center,
                           width: double.infinity,
                           child: Padding(
                             padding: const EdgeInsets.all(15.0),
                             child: Text("Scheduled an appointment",style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.w500,
                                 color: Colors.white
                             ),),
                           ),
                         ),),
                     )
                   ],
                 ),
               ]
           ),
         ],
       ),
     ),
   ));
  }
}