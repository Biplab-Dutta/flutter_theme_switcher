import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switching_demo/theme_cubit/theme_cubit.dart';
import 'package:theme_switching_demo/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switching Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Follow me on my socials',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Text(
              'https://github.com/Biplab-Dutta',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 10),
            Text(
              'https://twitter.com/b_plab98',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeCubit>().switchTheme(),
        tooltip: 'Switch Theme',
        child: context.read<ThemeCubit>().state.theme == AppTheme.lightTheme
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),
    );
  }
}
