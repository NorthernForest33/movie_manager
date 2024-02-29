import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/blocs/home_movie_lists_bloc/home_movie_lists_bloc.dart';
import 'package:movie_manager/domain/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_manager/domain/blocs/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';
import 'package:movie_manager/router/router.dart';

class MovieManagerApp extends StatefulWidget {

  const MovieManagerApp({super.key});

  @override
  State<MovieManagerApp> createState() => _MovieManagerAppState();
}

final _router = AppRouter();

class _MovieManagerAppState extends State<MovieManagerApp> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 1, 42, 80);
    return RepositoryProvider(
      create: (context) => MovieRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MovieListBloc(
                movieRepository:
                    RepositoryProvider.of<MovieRepository>(context)),
          ),
          BlocProvider(
            create: (context) => HomeMovieListsBloc(
                movieRepository:
                    RepositoryProvider.of<MovieRepository>(context)),
          ),
          BlocProvider( create: (context) => MovieDetailsBloc(
                movieRepository:
                    RepositoryProvider.of<MovieRepository>(context)),)
        ],
        child: MaterialApp.router(
          title: 'Movie manager',
          theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: const Color.fromARGB(255, 30, 62, 78),
            unselectedWidgetColor: Colors.white,
            useMaterial3: true,
          ),
          routerConfig: _router.config(),
        ),
      ),
    );
  }
}

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SearchMovieRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          backgroundColor: theme.primaryColor,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _openPage(index, tabsRouter),
              backgroundColor: theme.primaryColor,
              selectedItemColor: const Color.fromARGB(255, 146, 199, 248),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Домой'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Поиск'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: 'Профиль'),
              ]),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
