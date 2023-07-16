import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wifilockproject/screens/SetPasswordScreen.dart';
import 'package:wifilockproject/screens/VirtualHotelScreen.dart';

class HomePage extends StatefulWidget {
  static String routeName = 'HomePageScreen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _kodController = TextEditingController();
  String _feedbackMessage = '';

  Future<void> _sendRequest(String kod) async {
    final ipAddress = '192.168.68.112'; // ESP32'nin IP adresi
    final url = Uri.http(ipAddress, '/kapikodu', {'kod': kod});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _feedbackMessage = 'Kapı açıldı';
      });
    } else if (response.statusCode == 401) {
      setState(() {
        _feedbackMessage = 'Geçersiz kod';
      });
    } else {
      setState(() {
        _feedbackMessage = 'Bir hata oluştu';
      });
    }
  }

  Future<void> _sendLock(String kod) async {
    final ipAddress = '192.168.68.112'; // ESP32'nin IP adresi
    final url = Uri.http(ipAddress, '/kapikodu', {'kod': kod});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _feedbackMessage = 'Kapı Kilitlendi';
      });
    } else if (response.statusCode == 401) {
      setState(() {
        _feedbackMessage = 'Kapı Kilitlenemedi';
      });
    } else {
      setState(() {
        _feedbackMessage = 'Bir hata oluştu';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kapı Kontrolü'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SetPassword.routeName);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _kodController,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),),
                  labelText: 'Kapı Kod',fillColor:Colors.orangeAccent ,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, VirtualHotel.routeName);
                    },
                    child: Text("Sanal Otel"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String kod = "LOG${_kodController.text}";
                      print("$kod");

                      _sendRequest(kod);
                    },
                    child: Text('Kapıyı Aç'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String kodLock = "LCK";
                      print(kodLock);
                      _sendLock(kodLock);
                    },
                    child: Text('Kapıyı Kilitle'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text(
                _feedbackMessage,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
