import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/theme_cubit.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((ThemeCubit cubit) => cubit.isDark);

    return CupertinoSwitch(
      value: isDark,
      onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
    );
  }
}
  