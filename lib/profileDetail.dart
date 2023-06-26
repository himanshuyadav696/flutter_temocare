import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:temocare_flutter/editProfile.dart';
class ProfileDetail extends StatefulWidget{
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileState();
}
class _ProfileState extends State<ProfileDetail>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          height: 170,
                          color: HexColor("#F2A56F"),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assests/images/backbutton.svg"),
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lucy Martin",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 25,
                            ),),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Contact Number",maxLines: 1,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text("+123456677",maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Email",maxLines: 1,
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text("lucy@yopmail.com",maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Age",maxLines: 1,
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text("20",maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Gender",maxLines: 1,
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                                  Text("male",maxLines: 1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 115),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Card(
                              elevation: 4,
                              shape: CircleBorder(),
                              child: SvgPicture.asset("assests/images/ic_google.svg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            child: SizedBox(
                              height: 35,
                              width: 60,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.pink, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Edit",style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.pink
                                ),)),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return EditProfile();
                              }));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                        onPressed: (){
                    },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                        side: MaterialStateProperty.all(BorderSide(
                          color: Colors.pink,
                        )),
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Change Password",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.pink
                    ),),
                        ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          ))
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Delete Account",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}