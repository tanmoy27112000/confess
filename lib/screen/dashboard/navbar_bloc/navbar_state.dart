part of 'navbar_bloc.dart';

abstract class NavbarState {
  const NavbarState();
}

class NavbarInitialState extends NavbarState {
  const NavbarInitialState();
}

class NavbarLoadingState extends NavbarState {
  const NavbarLoadingState();
}

class NavbarLoadedState extends NavbarState {
  const NavbarLoadedState({required this.tagList});

  final List<TagModel> tagList;
}

class NavbarErrorState extends NavbarState {
  const NavbarErrorState({
    required this.message,
  });
  final String message;
}
