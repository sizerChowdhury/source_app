import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:source_app/src/messages.g.dart';

void main() {
  runApp(SourceApp());
}

class SourceApp extends StatelessWidget {
  const SourceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Source',
      home: SourceHomePage(),
    );
  }
}

class SourceHomePage extends StatefulWidget {
  @override
  _SourceHomePageState createState() => _SourceHomePageState();
}

class _SourceHomePageState extends State<SourceHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Source App'),
      ),
      body: Center(
        child: TextButton(
          onPressed: _navigateDestination,
          child: Text('Navigate to Destination App'),
        ),
      ),
    );
  }

  Future<void> _navigateDestination() async {
    try {
      const imageUrl = 'https://picsum.photos/id/237/200/300';
      // const imageUrl = 'https://picsum.photos/200/300?grayscale';
      final ExampleHostApi _api = ExampleHostApi();
      await _api.sendMessage(imageUrl);
    } on PlatformException catch (e) {
      print("Failed to open destination app: '${e.message}'.");
    }
  }
}
