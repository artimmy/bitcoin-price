import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _newPrice = "Click 'Update'";

  _returnPrice() async
  {
    var url = Uri.parse('https://blockchain.info/ticker');

    http.Response response = await http.get(url);
    Map<String, dynamic> decode = json.decode( response.body );
    //debugPrint("Response: " + decode["BRL"]["buy"].toString()); // ????? LOLOLOLOL BRL to string???????

    setState(() {
      _newPrice = decode["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Image.asset("images/bitcoin.png"),

            Padding(
              padding:const EdgeInsets.only(bottom: 25, top: 25),
              child: Text(
                "R\$ " + _newPrice,
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _returnPrice, 
              child: const Text("Update"),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffF7931A),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );
  }
}