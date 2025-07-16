import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubits/theme_cubit.dart';
import 'presentation/routes/app_router.dart';
import 'logic/cubits/book_cubit.dart'; 

class BookExplorerApp extends StatelessWidget {
  const BookExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => BookCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: theme,
          );
        },
      ),
    );
  }
}
