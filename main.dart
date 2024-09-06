import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permissions Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  // دالة طلب الأذونات
  Future<void> _requestPermissions() async {
    // طلب إذن قراءة الرسائل وإذن الإنترنت
    var smsPermission = await Permission.sms.request();
    var internetPermission = await Permission.internet.request();

    if (smsPermission.isGranted && internetPermission.isGranted) {
      // إذا تم منح الأذونات
      print("Permissions granted for SMS and Internet");
    } else {
      // إذا لم يتم منح الأذونات
      print("Permissions denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text('Hello, Welcome to the app!'),
      ),
    );
  }
}
