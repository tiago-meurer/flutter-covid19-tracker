import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//HTTP Request by Tiago Meurer - https://github.com/tiago-meurer/

class CasesPage extends StatefulWidget {
  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http.get(
        "https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php",
        headers: {
          'x-rapidapi-key': 'a023a534c9msh812afb5e7a234c5p1aecf5jsn01979780b78a'
        });
    data = json.decode(response.body);
    setState(() {
      userData = data["countries_stat"];
    });
    debugPrint(userData.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${userData[index]["country_name"]}: ${userData[index]["cases"]}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),              
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "New Cases: ${userData[index]["new_cases"]}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[400],
                    ),
                  ),              
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
