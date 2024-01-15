import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const _Initial()) {
    on<ProfileEvent>((event, emit) {
      //TODO: implement event handler
    });
  }
}
