import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealapp/provider/filterprovider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenfree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.glutenfree, ischecked);
            },
            title: Text(
              "Gultem-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include gulten-free meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetrain]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegetrain, ischecked);
            },
            title: Text(
              "Vegetrain",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Vegetrain food ",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactosefree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.lactosefree, ischecked);
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Lactose-free meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegan, ischecked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              "Only include Vegan meal",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )
        ],
      ),
    );
  }
}
