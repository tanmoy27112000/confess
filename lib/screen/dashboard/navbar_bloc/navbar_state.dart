part of 'navbar_bloc.dart';

@freezed
class NavbarState with _$NavbarState {
  const factory NavbarState.initial() = _Initial;
  const factory NavbarState.loading() = _Loading;
  const factory NavbarState.loaded({
    required List<TagModel> tagList,
  }) = _Loaded;
  const factory NavbarState.error({required String message}) = _Error;
}
