import 'package:confess/helper/prefs_helper.dart';
import 'package:confess/l10n/l10n.dart';
import 'package:confess/routes/router.dart';
import 'package:confess/screen/dashboard/dashboard_bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    PrefsHelper.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(),
        ),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: snackbarKey,
        routerConfig: router,
        restorationScopeId: 'confess',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
      ).animate().fadeIn(
            duration: 400.ms,
          ),
    );
  }
}
