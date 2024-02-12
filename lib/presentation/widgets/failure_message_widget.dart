import 'package:flutter/material.dart';

class FailureMessageWidget extends StatelessWidget {
  final void Function() onBlocEvent;
  const FailureMessageWidget({
    Key? key,
    required this.onBlocEvent,
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
            OutlinedButton(
                onPressed: () => onBlocEvent(),
                child: const Text(
                  'Попробывать снова',
                  style: TextStyle(color: Colors.white),
                ))
        ],
      ),
    );
  }
}
