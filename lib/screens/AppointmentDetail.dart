import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
class AppointmentDetail extends StatefulWidget{
  const AppointmentDetail({super.key});

  @override
  State<AppointmentDetail> createState() => _Appointmentdetail();
}
class _Appointmentdetail extends State<AppointmentDetail>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: SvgPicture.asset("assests/images/backbutton.svg"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            const Expanded(
              child: Text(
                "Upcoming",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 58,
              height: 58,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor("#F2A56F")
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height:90,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.blueGrey
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset("assests/images/iv_doctor.png"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Doctor",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),),
                          SizedBox(height: 10,),
                          Text("Nurosugeon",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("10 Years",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Scheduled Appointment",style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),),
              const SizedBox(
                height: 10,
              ),
              const Text("Today. October 22 2022",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),),
              const SizedBox(
                height: 10,
              ),
              const Text("16:00 - 16:40 PM  (40 minutes)",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),),
              const SizedBox(
                height: 30,
              ),
              const Text("Patient Information",style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),),
                      SizedBox(height: 10),
                      Text("Gender",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                      Text("Age",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    children: [
                      Text(":",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                      Text(":",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                      Text(":",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Himanshu Yadav",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                      Text("Male",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                      Text("20",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      )),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Your Package",style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
              ),),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey,width: 1.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("assests/images/yellow_video.svg"),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Video consultation",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                ),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Video call with doctor",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Appointment Completed",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}