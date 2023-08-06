part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;
  //get all confession
  const factory DashboardEvent.getAllConfession() = _GetAllConfession;
  //get latest confession
  const factory DashboardEvent.getLatestConfession() = _GetLatestConfession;
  //get company list
  const factory DashboardEvent.getCompanyList() = _GetCompanyList;
}
