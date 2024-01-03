
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class ForgotEmail extends StatelessWidget{
  const ForgotEmail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                          height: 60,
                          width: 60,
                        child: SvgPicture.asset("assests/images/ic_back.svg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: const Text("Forgot Password",style: TextStyle(
                          color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500
                        ),),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Please enter your phone number. you willreceive a code to verify phone number",
                  style: TextStyle(fontSize: 16,height: 1.5)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Enter email"
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return OtpScreen();
                      }));
                    },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                        child: const Text("Send otp",style: TextStyle(color: Colors.white),)
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Otp Screen Starts From Here
class OtpScreen extends StatelessWidget {
   OtpScreen({super.key});
  FocusNode fNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: SvgPicture.asset("assests/images/ic_back.svg"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Otp Verification",style: TextStyle(
                            color: Colors.black,fontSize: 22,fontWeight: FontWeight.w500
                        ),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Enter otp here",style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: TextField(
                              style: const TextStyle(fontSize: 20),
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: "0",
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: TextField(
                              style: const TextStyle(fontSize: 20),
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  hintText: "0",
                                  counterText: ""
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: TextField(
                              style: const TextStyle(fontSize: 20),
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  hintText: "0",
                                  counterText: ""
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: TextField(
                            style: const TextStyle(fontSize: 20),
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                hintText: "0",
                                counterText: ""
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                        child: const Text("Next"),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text("Didn’t received any code",style: TextStyle(
                          color: Colors.black,fontSize: 16
                        ),),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("Resend a new code",style: TextStyle(
                              color: Colors.blue,fontSize: 16
                          ),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}