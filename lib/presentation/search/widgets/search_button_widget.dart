import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/blocs/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
  final bloc = BlocProvider.of<MovieListBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(220),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          onChanged: (query) => bloc.add(LoadMovieList(queryParameters: MovieListRequestParametrs().searchRequstParametrs(query, '1'))),
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintStyle: TextStyle(fontSize: 18),
            hintText: 'Поиск...',
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            
          ),
        ),
      ),
    );
  }
}