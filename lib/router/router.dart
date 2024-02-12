import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/movie_manager_app.dart';
import 'package:movie_manager/presentation//home/home_screen.dart';
import 'package:movie_manager/presentation//profile/profile_screen.dart';
import 'package:movie_manager/presentation//search/search_movie_screen.dart';
import 'package:movie_manager/presentation/movie_details/movie_details_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/', children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: SearchMovieRoute.page, path: 'search'),
          AutoRoute(page: ProfileRoute.page, path: 'profile'),
        ],
        ),
        AutoRoute(page: MovieDetailsRoute.page, path: '/movie_details'),
      ];
}
