import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool useMaterial3 = false;
  bool enableShadow = true;

  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3;
    });
  }

  void handleShadowChange() {
    setState(() {
      enableShadow = !enableShadow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: useMaterial3,
        brightness: Brightness.light,
        colorSchemeSeed: const Color(0xff6750a4),
      ),
      darkTheme: ThemeData(
        useMaterial3: useMaterial3,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff6750a4),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: useMaterial3
              ? const Text("Material 3 Elevation")
              : const Text("Material 2 Elevation"),
          actions: <Widget>[
            IconButton(
              icon: useMaterial3
                  ? const Icon(Icons.filter_3)
                  : const Icon(Icons.filter_2),
              onPressed: handleMaterialVersionChange,
              tooltip: "Switch to Material ${useMaterial3 ? 2 : 3}",
            ),
            IconButton(
              icon: enableShadow
                  ? const Icon(Icons.wb_incandescent_sharp)
                  : const Icon(Icons.wb_incandescent_outlined),
              onPressed: handleShadowChange,
              tooltip: "Turn ${enableShadow ? 'off' : 'on'} shadow",
            ),
          ],
        ),
        body: ElevationList(enableShadow: enableShadow),
      ),
    );
  }
}

class ElevationList extends StatelessWidget {
  const ElevationList({super.key, required this.enableShadow});

  final bool enableShadow;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final double exponentialElevation = index.toDouble() + 1;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: exponentialElevation,
            shadowColor: enableShadow
                ? Theme.of(context).colorScheme.shadow
                : Colors.transparent,
            child: Center(
              child: Text('elevation: $exponentialElevation'),
            ),
          ),
        );
      },
    );
  }
}
