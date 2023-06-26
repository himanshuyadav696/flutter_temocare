import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:temocare_flutter/doctorDetail.dart';
import 'package:temocare_flutter/myAppointment.dart';
import 'package:temocare_flutter/profileDetail.dart';
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){

            }, icon: Icon(
              Icons.home
            )),
            IconButton(onPressed: (){

            }, icon: Icon(
                Icons.calendar_month
            )),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return myAppointment();
              }));
            }, icon: Icon(
                Icons.calendar_month_sharp
            )),
            IconButton(onPressed: (){

            }, icon: SvgPicture.asset(
                "assests/images/ic_profile.svg",
              semanticsLabel: "Profile",
            ))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: const <Widget>[
                         Text("Hello",
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 24,
                               fontWeight: FontWeight.w500),
                         ),
                         Text(
                           "Himanshu",
                           softWrap: true,
                           style: TextStyle(
                             fontSize: 25,
                             color: Colors.black
                           ),
                         )
                       ],
                     ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return ProfileDetail();
                        }));
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                          child: SvgPicture.asset("assests/images/ic_google.svg"),
                        ),
                      ),
                    )
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 15),
                   child: SizedBox(
                     width: double.infinity,
                     height: 160,
                     child: Card(
                       color: HexColor("#F2A56F"),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.only(top: 50,bottom: 40,left: 20),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: const <Widget>[
                                 Text("Get the best",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 24,
                                       fontWeight: FontWeight.w500),
                                 ),
                                 Text("Medical Services",
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 24,
                                       fontWeight: FontWeight.w500),
                                 ),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 20),
                             child: SizedBox(
                               height: 200,
                               width: 100,
                               child: Image.asset("assests/images/iv_doctor.png")
                             ),
                           )
                         ],
                       )
                     ),
                   ),
                 ),
              ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                         itemCount: 10,
                         shrinkWrap: true,
                         itemBuilder: (BuildContext context, int index) {
                           return Padding(
                             padding: const EdgeInsets.only(top: 5,bottom: 5),
                             child: Container(
                               width: double.infinity,
                               height: 100,
                               decoration: BoxDecoration(
                                 border: Border.all(color: Colors.grey),
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(Radius.circular(20)),
                               ),
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(15),
                                     child: Container(
                                       height:90,
                                       width: 60,
                                       decoration: BoxDecoration(
                                         border: Border.all(color: Colors.black),
                                         borderRadius: BorderRadius.all(Radius.circular(10))
                                       ),
                                       child: Image.asset("assests/images/iv_doctor.png"),
                                     ),
                                   ),
                                   Expanded(
                                       child: Container(
                                     child: Padding(
                                       padding: const EdgeInsets.only(top: 15),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Dr Himanshu",style: TextStyle(
                                             color: Colors.black,
                                             fontSize: 20,
                                             fontWeight: FontWeight.w500,
                                           ),),
                                           Text("Neurologist",style: TextStyle(
                                             fontSize: 16,
                                             color: Colors.grey,
                                             fontWeight: FontWeight.w400,
                                           ),),
                                           Row(
                                             children: [
                                               Text("20 | ",style: TextStyle(
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.w500
                                               ),),
                                               Padding(
                                                 padding: const EdgeInsets.only(right: 10),
                                                 child: Text("Exp: 5 years",style: TextStyle(
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.w500
                                                 ),),
                                               ),
                                               Expanded(
                                                 child: InkWell(
                                                   onTap: (){
                                                     Navigator.push(context, MaterialPageRoute(builder: (context){
                                                       return doctorDetail();
                                                     }));
                                                   },
                                                   child: Padding(
                                                     padding: const EdgeInsets.only(right: 5),
                                                     child: Container(
                                                       width: 120,
                                                           height: 40,
                                                           decoration: BoxDecoration(
                                                             border: Border.all(color: HexColor("#ED787E")),
                                                             borderRadius: BorderRadius.all(Radius.circular(30))
                                                           ),
                                                           child: Container(
                                                             alignment: Alignment.center,
                                                               child: Text("Appointment",style: TextStyle(
                                                                 color: HexColor("#ED787E"),
                                                                 fontWeight: FontWeight.w400,
                                                                 fontSize: 16
                                                               ),),
                                                           ),
                                                         ),
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                   ))
                                 ],
                               ),
                             ),
                           );
                         }),
               ],
              ),
            ),
        ),
      ),
    );
  }
}

