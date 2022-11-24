import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool useMaterial3 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: useMaterial3,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.green,
      ),
      darkTheme: ThemeData(
        useMaterial3: useMaterial3,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Material 3 ColorScheme"),
        ),
        body: const ColorsList(),
      ),
    );
  }
}

class ColorsList extends StatelessWidget {
  const ColorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          ColorPairItem(
            colorName1: 'primary',
            color1: colorScheme.primary,
            colorName2: 'onPrimary',
            color2: colorScheme.onPrimary,
          ),
          ColorPairItem(
            colorName1: 'primaryContainer',
            color1: colorScheme.primaryContainer,
            colorName2: 'onPrimaryContainer',
            color2: colorScheme.onPrimaryContainer,
          ),
          ColorPairItem(
            colorName1: 'secondary',
            color1: colorScheme.secondary,
            colorName2: 'onSecondary',
            color2: colorScheme.onSecondary,
          ),
          ColorPairItem(
            colorName1: 'secondaryContainer',
            color1: colorScheme.secondaryContainer,
            colorName2: 'onSecondaryContainer',
            color2: colorScheme.onSecondaryContainer,
          ),
          ColorPairItem(
            colorName1: 'tertiary',
            color1: colorScheme.tertiary,
            colorName2: 'onTertiary',
            color2: colorScheme.onTertiary,
          ),
          ColorPairItem(
            colorName1: 'tertiaryContainer',
            color1: colorScheme.tertiaryContainer,
            colorName2: 'onTertiaryContainer',
            color2: colorScheme.onTertiaryContainer,
          ),
          ColorPairItem(
            colorName1: 'error',
            color1: colorScheme.error,
            colorName2: 'onError',
            color2: colorScheme.onError,
          ),
          ColorPairItem(
            colorName1: 'background',
            color1: colorScheme.background,
            colorName2: 'onBackground',
            color2: colorScheme.onBackground,
          ),
          ColorPairItem(
            colorName1: 'surface',
            color1: colorScheme.surface,
            colorName2: 'onSurface',
            color2: colorScheme.onSurface,
          ),
          ColorPairItem(
            colorName1: 'surfaceVariant',
            color1: colorScheme.surfaceVariant,
            colorName2: 'onSurfaceVariant',
            color2: colorScheme.onSurfaceVariant,
          ),
          ColorPairItem(
            colorName1: 'inverseSurface',
            color1: colorScheme.inverseSurface,
            colorName2: 'onInverseSurface',
            color2: colorScheme.onInverseSurface,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: ColorItem(
                  name: 'inversePrimary',
                  color: colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: ColorItem(
                  name: 'surfaceTint',
                  color: colorScheme.surfaceTint,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: ColorItem(
                  name: 'outline',
                  color: colorScheme.outline,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: ColorItem(
                  name: 'outlineVariant',
                  color: colorScheme.outlineVariant,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: ColorItem(
                  name: 'shadow',
                  color: colorScheme.shadow,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: ColorItem(
                  name: 'scrim',
                  color: colorScheme.scrim,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorPairItem extends StatelessWidget {
  const ColorPairItem({
    super.key,
    required this.colorName1,
    required this.color1,
    required this.colorName2,
    required this.color2,
  });

  final String colorName1;
  final Color color1;
  final String colorName2;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Text(
              colorName1,
              textAlign: TextAlign.center,
              style: TextStyle(color: color2),
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                colorName2,
                textAlign: TextAlign.center,
                style: TextStyle(color: color1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
