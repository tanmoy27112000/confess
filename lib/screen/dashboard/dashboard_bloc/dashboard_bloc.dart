import 'package:bloc/bloc.dart';
import 'package:confess/helper/database_helper.dart';
import 'package:confess/model/confession_model/confession_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const _Initial()) {
    on<_GetAllConfession>((event, emit) async {
      emit(const _Loading());
      try {
        confessionList = await DatabaseHelper.instance.getAllConfession();
        emit(_Loaded(confessionList: confessionList));
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetLatestConfession>((event, emit) async {
      try {
        final newList = await DatabaseHelper.instance.getAllConfession();
        // add all new document with id that does not exist in confessionList
        confessionList.insert(0, newList.first);
        emit(const _Loading());
        emit(_Loaded(confessionList: confessionList));
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    // on<_GetCompanyList>((event, emit) async {
    //   try {
    //     companyList.value = await DatabaseHelper.instance.getCompanyData();
    //     emit(
    //       _Loaded(
    //         confessionList: confessionList,
    //       ),
    //     );
    //   } catch (e) {
    //     emit(_Error(message: e.toString()));
    //   }
    // });
  }

  List<ConfessionModel> confessionList = [];
}
