import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form validation"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value){
                  if(value!.isEmpty){
                    return "Email is required!!!!";
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value){
                  if(value!.length < 6){
                    return "Length must be minimum 6";
                  }
                  if(value.length > 15){
                    return "Length must be maximum 15";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("validate");
                  } else {
                    print("invalidate");
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
