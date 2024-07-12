import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, List<String>> {
  final MovieRepository _movieRepository;
  MovieBloc(this._movieRepository) : super([]) {
    on<SearchMovieEvent>(
      (event, state) async {
        var result = await _movieRepository.search(event.key);
        print(result);
        emit(result);
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 1000))
          .flatMap(mapper),
    );
  }
  @override
  void onTransition(Transition<MovieEvent, List<String>> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
  }
}

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends MovieEvent {
  final String key;
  SearchMovieEvent(this.key);
}
