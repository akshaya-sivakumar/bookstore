import 'package:bookstore/ui/dashbaord.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 40,
            //width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              //controller: _controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Enter your name....',
                  suffixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.only(left: 10)),
              onChanged: (value) {},
            ),
          ),
          ElevatedButton(
            child: Text(
              "Let's get started",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              onPrimary: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          )
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _buildContent(context));
  }
}
