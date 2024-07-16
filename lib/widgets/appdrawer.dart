import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.selectedpage});

  final void Function(String identifer) selectedpage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.onPrimaryContainer,
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text("Cooking Up!",
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              'Meal',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              selectedpage("meal");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filter',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              selectedpage("filter");
            },
          )
        ],
      ),
    );
  }
}
