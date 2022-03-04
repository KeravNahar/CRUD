import 'package:crud/screens/widgets/text_field_no_icon.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late UserCredential userCredential;

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  TextEditingController eid = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController aadhar = TextEditingController();
  TextEditingController salary = TextEditingController();


  cleardata(){
    eid.clear();
    name.clear();
    email.clear();
    number.clear();
    address.clear();
    aadhar.clear();
    salary.clear();
  }

  Future sendData()async{
      await FirebaseFirestore.instance.collection('EmployeeData').doc().set({
        'email': email.text.trim(),
        'username': name.text.trim(),
        'Emp_id': eid.text.trim(),
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
          title:Text('Add New Employee', style:TextStyle(fontSize: 20, color: Colors.white) ,),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidTextFieldNIC(
                  hintText: "Employee ID",
                  obscureText: false,
                  controller: eid,
                ),
                WidTextFieldNIC(
                  hintText: "Name of Employee",
                  obscureText: false,
                  controller: name,
                ),
                WidTextFieldNIC(
                  hintText: "Email address",
                  obscureText: false,
                  controller: email,
                ),
                WidTextFieldNIC(
                  hintText: "Mobile number",
                  obscureText: false,
                  controller: number,
                ),
                WidTextFieldNIC(
                  hintText: "Home Address",
                  obscureText: false,
                  controller: address,
                ),
                WidTextFieldNIC(
                  hintText: "Aadhar Card Number",
                  obscureText: false,
                  controller: aadhar,
                ),
                WidTextFieldNIC(
                  hintText: "Salary (in Rs.)",
                  obscureText: false,
                  controller: salary,

                ),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width : 135,
                      child: RaisedButton(
                        color: Colors.red[900],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onPressed: () {
                          sendData();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()),);
                        },
                        child: Text("Register", style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 60,
                      width : 135,
                      child: RaisedButton(
                        color: Colors.red[900],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onPressed: () {
                          cleardata();
                        },
                        child: Text("Reset", style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                  ],
                )
              ],
            ),
        )
    );
  }
}
