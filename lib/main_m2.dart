import 'package:flutter/material.dart';

enum AppMenu {
  about,
  privacy,
  settings,
}

void main() => runApp(const PlantsApp());

class PlantsApp extends StatelessWidget {
  const PlantsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.green[700],
          secondary: Colors.green[700],
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          hintStyle: TextStyle(
            color: Colors.green[700],
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.green[700],
          secondary: Colors.green[700],
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          hintStyle: TextStyle(
            color: Colors.green[700],
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
      ),
      home: const PlantsHome(),
    );
  }
}

class PlantsHome extends StatelessWidget {
  const PlantsHome({super.key});

  Future<void> _shoppingCartDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Shopping cart'),
          icon: const Icon(Icons.shopping_cart_rounded),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('1 x Lorem Ipsum'),
                  Text('\$9.99'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Checkout'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plants Shop'),
        leading: Center(
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            foregroundColor: colorScheme.primary,
            child: const Icon(Icons.person),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
            child: const TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Browse indoor plants',
                filled: true,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_rounded),
          ),
          PopupMenuButton<AppMenu>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<AppMenu>>[
              const PopupMenuItem<AppMenu>(
                value: AppMenu.about,
                child: Text('About us'),
              ),
              const PopupMenuItem<AppMenu>(
                value: AppMenu.privacy,
                child: Text('Privacy Policy'),
              ),
              const PopupMenuItem<AppMenu>(
                value: AppMenu.settings,
                child: Text('Settings'),
              ),
            ],
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 12 / 15.5,
        ),
        itemBuilder: (context, index) {
          final String image = 'assets/plants/plant_$index.jpg';

          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlantDetailsPage(image: image),
                  ),
                );
              },
              child: PlantItem(
                image: image,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_rounded),
            label: 'Payments',
          ),
        ],
        currentIndex: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => _shoppingCartDialog(context),
        child: const Icon(Icons.shopping_cart_rounded),
      ),
    );
  }
}

class PlantItem extends StatelessWidget {
  const PlantItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Hero(
      tag: image,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Lorem Ipsum',
                style: textTheme.subtitle1,
              ),
              Text(
                '\$9.99',
                style: textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantDetailsPage extends StatelessWidget {
  const PlantDetailsPage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Lorem Ipsum',
                style:
                    TextStyle(color: AppBarTheme.of(context).foregroundColor),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: image,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                MaterialBanner(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          style: textTheme.headline6,
                        ),
                        Text(
                          '\$9.99',
                          style: textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ActionChip(
                      onPressed: () {},
                      label: const Text('Indoor'),
                    ),
                    ActionChip(
                      onPressed: () {},
                      label: const Text('Small'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline_rounded),
                label: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: const Text('Include base'),
                                trailing: Switch(
                                  onChanged: (value) {},
                                  value: true,
                                ),
                              ),
                              ListTile(
                                title: const Text('Gifting'),
                                trailing: Checkbox(
                                  onChanged: (value) {},
                                  value: true,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Proceed to payment'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
