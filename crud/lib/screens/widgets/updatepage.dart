import 'package:crud/screens/widgets/text_field_no_icon.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home.dart';
class UpdateEmployeePage extends StatefulWidget {
  final String id;
  final String title;
  final String nameDisplay;
  final String emailDisplay;
  final String numberDisplay;
  final String addressDisplay;
  final String aadharDisplay;
  final String salaryDisplay;
  const UpdateEmployeePage({
    Key? key,
    required this.id,
    required this.title,
    required this.nameDisplay,
    required this.emailDisplay,
    required this.numberDisplay,
    required this.addressDisplay,
    required this.aadharDisplay,
    required this.salaryDisplay,
  }) : super(key: key);

  @override
  _UpdateEmployeePageState createState() => _UpdateEmployeePageState();
}

class _UpdateEmployeePageState extends State<UpdateEmployeePage> {
  late UserCredential userCredential;

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController aadhar = TextEditingController();
  TextEditingController salary = TextEditingController();

  Future sendData(id)async{
    await FirebaseFirestore.instance.collection('EmployeeData').doc(id).update({
      'email': email.text.trim(),
      'username': name.text.trim(),
      'number' : number.text.trim(),
      'address':address.text.trim(),
      'aadhar' : aadhar.text.trim(),
      'salary':salary.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.white,),onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },),
          title:Text(widget.title, style:TextStyle(fontSize: 20, color: Colors.white) ,),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidTextFieldNIC(
                hintText: widget.nameDisplay,
                obscureText: false,
                controller: name,
              ),
              WidTextFieldNIC(
                hintText: widget.emailDisplay,
                obscureText: false,
                controller: email,
              ),
              WidTextFieldNIC(
                hintText: widget.numberDisplay,
                obscureText: false,
                controller: number,
              ),
              WidTextFieldNIC(
                hintText: widget.addressDisplay,
                obscureText: false,
                controller: address,
              ),
              WidTextFieldNIC(
                hintText: widget.aadharDisplay,
                obscureText: false,
                controller: aadhar,
              ),
              WidTextFieldNIC(
                hintText: widget.salaryDisplay,
                obscureText: false,
                controller: salary,

              ),
                  Container(
                    height: 60,
                    width : 200,
                    child: RaisedButton(
                      color: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      onPressed: () {
                        sendData(widget.id);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()),);
                      },
                      child: Text("Update Data", style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ),
            ],
          ),
        )
    );
  }
}
