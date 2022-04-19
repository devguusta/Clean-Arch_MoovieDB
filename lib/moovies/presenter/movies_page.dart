import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mooviedb/moovies/presenter/controllers/movies_controller.dart';
import 'package:mooviedb/moovies/presenter/movies_event.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

final bloc = Modular.get<MovieController>();

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    bloc.add(GetMovieEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text('MoviesPage $state'),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("get movies"))
              ],
            ),
          );
        });
  }
}
