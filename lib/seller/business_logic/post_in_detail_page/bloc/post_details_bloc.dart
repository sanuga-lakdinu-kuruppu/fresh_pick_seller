import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_details_event.dart';
part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  PostDetailsBloc() : super(PostDetailsInitial()) {
    on<PostDetailsEvent>((event, emit) {});
  }
}
