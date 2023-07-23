import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const _Initial()) {
    on<_GetAllConfession>((event, emit) async {
      emit(const _Loading());
      try {
        ConfessionList = await DatabaseHelper.instance.getAllConfession();
        emit(_Loaded(confessionList: ConfessionList));
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });
  }
  List<Document> ConfessionList = [];
}
