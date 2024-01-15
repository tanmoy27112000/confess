import 'package:bloc/bloc.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:confess/model/tag_model/tag_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_bloc.freezed.dart';
part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(const NavbarInitialState()) {
    on<_Started>(_onStarted);
    on<_GetTags>(_onGetTags);
  }

  List<TagModel> tagList = [];

  Future<void> _onStarted(_Started event, Emitter<NavbarState> emit) async {
    emit(const NavbarInitialState());
  }

  Future<void> _onGetTags(_GetTags event, Emitter<NavbarState> emit) async {
    emit(const NavbarLoadingState());

    try {
      tagList = await DatabaseHelper.instance.getTags(search: event.query);
      emit(NavbarLoadedState(tagList: tagList));
    } catch (e) {
      emit(NavbarErrorState(message: e.toString()));
    }
  }
}
