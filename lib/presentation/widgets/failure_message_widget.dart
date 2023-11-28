import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/blocs/movie_list_bloc/movie_list_bloc.dart';

class FailureMessageWidget extends StatelessWidget {
  final Bloc movieListBloc;
  final bool buttonTryAgain;

  const FailureMessageWidget({
    Key? key,
    required this.movieListBloc,
    this.buttonTryAgain = true
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Произошла ошибка',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Text('Пожалуйста, повторите попытку позже',
              style: TextStyle(color: Colors.blueGrey, fontSize: 16)),
            const SizedBox(height: 15),
            if(buttonTryAgain)...{
            OutlinedButton(
                onPressed: () {movieListBloc.add(LoadMovieList());},
                child: const Text(
                  'Попробывать снова',
                  style: TextStyle(color: Colors.white),
                ))}
        ],
      ),
    );
  }
}
