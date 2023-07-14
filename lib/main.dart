import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wifilockproject/routes.dart';
import 'package:wifilockproject/screens/SetPasswordScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kapı Kontrolü',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}

class HomePage extends StatefulWidget {
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
                decoration: InputDecoration(
                  labelText: 'Kapı Kodu',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String kod = "LOG${_kodController.text}";
                  print("$kod");

                  _sendRequest(kod);
                },
                child: Text('Kapıyı Aç'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String kodLock = "LCK";
                  print(kodLock);
                  _sendLock(kodLock);
                },
                child: Text('Kapıyı Kilitle'),
              ),
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
