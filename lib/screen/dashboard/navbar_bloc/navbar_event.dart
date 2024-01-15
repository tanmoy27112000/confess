part of 'navbar_bloc.dart';

@freezed
class NavbarEvent with _$NavbarEvent {
  const factory NavbarEvent.started() = _Started;
  const factory NavbarEvent.getTags({String? query}) = _GetTags;
}
