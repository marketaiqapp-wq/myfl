import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard functionality

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _copied = false;

  static const String _flutterCode = """import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
} అని చెప్పాను""";

  void _copyToClipboard() {
    Clipboard.setData(const ClipboardData(text: _flutterCode));
    setState(() {
      _copied = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _copied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // bg-gray-50
      body: Center( // flex flex-col items-center justify-center p-4 font-sans
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // p-4
          child: ConstrainedBox( // max-w-3xl w-full
            constraints: const BoxConstraints(
              maxWidth: 768.0, // max-w-3xl (approx 768px)
            ),
            child: Container(
              width: double.infinity, // w-full
              decoration: BoxDecoration(
                color: Colors.white, // bg-white
                borderRadius: BorderRadius.circular(24.0), // rounded-2xl
                boxShadow: [
                  BoxShadow( // shadow-xl (approx)
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border.all(color: const Color(0xFFF3F4F6)), // border border-gray-100
              ),
              clipBehavior: Clip.antiAlias, // overflow-hidden
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header section
                  Container(
                    padding: const EdgeInsets.all(32.0), // p-8
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: const Color(0xFFF3F4F6)), // border-b border-gray-100
                      ),
                      color: const Color(0xFFEFF6FF).withOpacity(0.3), // bg-blue-50/30
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( // flex items-center gap-2
                          children: [
                            const Text(
                              'Flutter "Hello World"',
                              style: TextStyle(
                                fontSize: 24, // text-2xl
                                fontWeight: FontWeight.bold, // font-bold
                                color: Color(0xFF1F2937), // text-gray-900
                              ),
                            ),
                            const SizedBox(width: 8), // gap-2 (approx for 2 units)
                            Icon(Icons.code_outlined, color: Colors.blue[400], size: 24), // FileCode2 icon equivalent
                          ],
                        ),
                        const SizedBox(height: 12), // mt-3 (approx for 3 units)
                        Text(
                          'This AI Studio environment is optimized for full-stack React web applications. However, I have written the native Flutter code you requested! You can copy the code below or find it in the /src/main.dart file to use in your local Flutter environment.',
                          style: TextStyle(
                            color: const Color(0xFF4B5563), // text-gray-600
                            height: 1.5, // leading-relaxed
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Code display section
                  Container(
                    color: const Color(0xFF1e1e1e), // bg-[#1e1e1e]
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Code block header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // px-4 py-3
                          decoration: const BoxDecoration(
                            color: Color(0xFF2d2d2d), // bg-[#2d2d2d]
                            border: Border(
                              bottom: BorderSide(color: Color(0xFF404040)), // border-b border-[#404040]
                            ),
                          ),
                          child: Row( // flex items-center justify-between
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row( // flex items-center gap-2 font-mono
                                children: [
                                  Icon(Icons.code, size: 16, color: Colors.blue[400]), // FileCode2 equivalent
                                  const SizedBox(width: 8), // gap-2
                                  const Text(
                                    'lib/main.dart',
                                    style: TextStyle(
                                      color: Color(0xFFd4d4d4), // text-[#d4d4d4]
                                      fontSize: 14, // text-sm
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: _copyToClipboard,
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0)), // px-2 py-1.5
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))), // rounded-md
                                  foregroundColor: MaterialStateProperty.all(const Color(0xFFd4d4d4)), // text-[#d4d4d4]
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14)),
                                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.hovered)) {
                                        return const Color(0xFF404040); // hover:bg-[#404040]
                                      }
                                      return null; // Defer to the widget's default.
                                    },
                                  ),
                                ),
                                child: Row( // flex items-center gap-1.5
                                  children: [
                                    Icon(
                                      _copied ? Icons.check : Icons.copy, // Check / Copy icon
                                      size: 16,
                                      color: _copied ? Colors.green[500] : const Color(0xFFd4d4d4),
                                    ),
                                    const SizedBox(width: 6), // gap-1.5 (approx for 1.5 units)
                                    Text(_copied ? 'Copied!' : 'Copy'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Code content display
                        SingleChildScrollView( // overflow-x-auto
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0), // p-6
                            child: Text(
                              _flutterCode,
                              style: const TextStyle(
                                color: Color(0xFFd4d4d4), // text-[#d4d4d4]
                                fontFamily: 'monospace', // font-mono
                                fontSize: 14, // text-sm
                                height: 1.5, // leading-relaxed
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}