import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SourceApp());
}

class SourceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Source App',
      home: SourceHomePage(),
    );
  }
}

class SourceHomePage extends StatefulWidget {
  @override
  _SourceHomePageState createState() => _SourceHomePageState();
}

class _SourceHomePageState extends State<SourceHomePage> {
  static const platform = MethodChannel('com.example.source_app/deep_link');
  final String message = 'https://www.gstatic.com/webp/gallery3/1.sm.png';

  Future<void> _openDestinationApp() async {
    try {
      await platform.invokeMethod('openDestinationApp', {'message': message});
    } on PlatformException catch (e) {
      print("Failed to open destination app: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Source App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openDestinationApp,
          child: Text('Go to Destination App'),
        ),
      ),
    );
  }
}
