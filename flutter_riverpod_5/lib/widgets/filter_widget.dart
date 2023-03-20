import 'package:flutter/material.dart';
import 'package:flutter_riverpod_5/riverpod/global_riverpods.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton(
          items: FavouriteStatus.values
              .map((fs) => DropdownMenuItem(
                    value: fs,
                    child: Text(fs.toString().split('.').last),
                  ))
              .toList(),
          value: ref.watch(favouriteStatusProvider),
          onChanged: (FavouriteStatus? fs) =>
              ref.read(favouriteStatusProvider.notifier).state = fs!,
        );
      },
    );
  }
}
