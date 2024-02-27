import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'test_pag1',
          path: '/testPag1',
          builder: (context, params) => const TestPag1Widget(),
        ),
        FFRoute(
          name: 'chat_ai_Screen',
          path: '/chatAiScreen',
          builder: (context, params) => const ChatAiScreenWidget(),
        ),
        FFRoute(
          name: 'Logoanimation',
          path: '/logoanimation',
          builder: (context, params) => const LogoanimationWidget(),
        ),
        FFRoute(
          name: 'Visualexercise_1',
          path: '/visualexercise1',
          builder: (context, params) => const Visualexercise1Widget(),
        ),
        FFRoute(
          name: 'test_pag2',
          path: '/testPag2',
          builder: (context, params) => const TestPag2Widget(),
        ),
        FFRoute(
          name: 'test_pag3',
          path: '/testPag3',
          builder: (context, params) => const TestPag3Widget(),
        ),
        FFRoute(
          name: 'test_pag4',
          path: '/testPag4',
          builder: (context, params) => const TestPag4Widget(),
        ),
        FFRoute(
          name: 'test_pag5',
          path: '/testPag5',
          builder: (context, params) => const TestPag5Widget(),
        ),
        FFRoute(
          name: 'test_pag6',
          path: '/testPag6',
          builder: (context, params) => const TestPag6Widget(),
        ),
        FFRoute(
          name: 'test_pag7',
          path: '/testPag7',
          builder: (context, params) => const TestPag7Widget(),
        ),
        FFRoute(
          name: 'test_pag8',
          path: '/testPag8',
          builder: (context, params) => const TestPag8Widget(),
        ),
        FFRoute(
          name: 'test_pag9',
          path: '/testPag9',
          builder: (context, params) => const TestPag9Widget(),
        ),
        FFRoute(
          name: 'test_pag10',
          path: '/testPag10',
          builder: (context, params) => const TestPag10Widget(),
        ),
        FFRoute(
          name: 'Videoexercise_1',
          path: '/videoexercise1',
          builder: (context, params) => const Videoexercise1Widget(),
        ),
        FFRoute(
          name: 'Audioexercise_1',
          path: '/audioexercise1',
          builder: (context, params) => const Audioexercise1Widget(),
        ),
        FFRoute(
          name: 'Success_page',
          path: '/successPage',
          builder: (context, params) => const SuccessPageWidget(),
        ),
        FFRoute(
          name: 'audioexercise2',
          path: '/audioexercise2',
          builder: (context, params) => const Audioexercise2Widget(),
        ),
        FFRoute(
          name: 'Before_results',
          path: '/beforeResults',
          builder: (context, params) => const BeforeResultsWidget(),
        ),
        FFRoute(
          name: 'Kinestheticexercise_1',
          path: '/kinestheticexercise1',
          builder: (context, params) => const Kinestheticexercise1Widget(),
        ),
        FFRoute(
          name: 'SimonSays',
          path: '/simonSays',
          builder: (context, params) => const SimonSaysWidget(),
        ),
        FFRoute(
          name: 'test_pag1Copy',
          path: '/testPag1Copy',
          builder: (context, params) => const TestPag1CopyWidget(),
        ),
        FFRoute(
          name: 'chatbotLeire',
          path: '/chatbotLeire',
          builder: (context, params) => const ChatbotLeireWidget(),
        ),
        FFRoute(
          name: 'Loading_page',
          path: '/loadingPage',
          builder: (context, params) => const LoadingPageWidget(),
        ),
        FFRoute(
          name: 'Unsuccess_page',
          path: '/unsuccessPage',
          builder: (context, params) => const UnsuccessPageWidget(),
        ),
        FFRoute(
          name: 'mentalHealth',
          path: '/mentalHealth',
          builder: (context, params) => const MentalHealthWidget(),
        ),
        FFRoute(
          name: 'mentalHealthCopy',
          path: '/mentalHealthCopy',
          builder: (context, params) => const MentalHealthCopyWidget(),
        ),
        FFRoute(
          name: 'Homepage_Visual',
          path: '/homepageVisual',
          builder: (context, params) => const HomepageVisualWidget(),
        ),
        FFRoute(
          name: 'Readingexercise_1',
          path: '/readingexercise1',
          builder: (context, params) => const Readingexercise1Widget(),
        ),
        FFRoute(
          name: 'SimonSaysCopy',
          path: '/simonSaysCopy',
          builder: (context, params) => const SimonSaysCopyWidget(),
        ),
        FFRoute(
          name: 'Visualexercise_2Copy',
          path: '/visualexercise2Copy',
          builder: (context, params) => const Visualexercise2CopyWidget(),
        ),
        FFRoute(
          name: 'success_audio1',
          path: '/successAudio1',
          builder: (context, params) => const SuccessAudio1Widget(),
        ),
        FFRoute(
          name: 'unsuccess_audio1',
          path: '/unsuccessAudio1',
          builder: (context, params) => const UnsuccessAudio1Widget(),
        ),
        FFRoute(
          name: 'unsuccess_video1',
          path: '/unsuccessVideo1',
          builder: (context, params) => const UnsuccessVideo1Widget(),
        ),
        FFRoute(
          name: 'unsuccess_read1',
          path: '/unsuccessRead1',
          builder: (context, params) => const UnsuccessRead1Widget(),
        ),
        FFRoute(
          name: 'unsuccess_visual1',
          path: '/unsuccessVisual1',
          builder: (context, params) => const UnsuccessVisual1Widget(),
        ),
        FFRoute(
          name: 'unsuccess_visual2',
          path: '/unsuccessVisual2',
          builder: (context, params) => const UnsuccessVisual2Widget(),
        ),
        FFRoute(
          name: 'succes_visual1',
          path: '/succesVisual1',
          builder: (context, params) => const SuccesVisual1Widget(),
        ),
        FFRoute(
          name: 'profile_audi',
          path: '/profileAudi',
          builder: (context, params) => const ProfileAudiWidget(),
        ),
        FFRoute(
          name: 'perfil_lector',
          path: '/perfilLector',
          builder: (context, params) => const PerfilLectorWidget(),
        ),
        FFRoute(
          name: 'perfil_visual',
          path: '/perfilVisual',
          builder: (context, params) => const PerfilVisualWidget(),
        ),
        FFRoute(
          name: 'perfil_kinestesico',
          path: '/perfilKinestesico',
          builder: (context, params) => const PerfilKinestesicoWidget(),
        ),
        FFRoute(
          name: 'Homepage_Lector',
          path: '/homepageLector',
          builder: (context, params) => const HomepageLectorWidget(),
        ),
        FFRoute(
          name: 'Homepage_kinestesico',
          path: '/homepageKinestesico',
          builder: (context, params) => const HomepageKinestesicoWidget(),
        ),
        FFRoute(
          name: 'Success_pageCopy',
          path: '/successPageCopy',
          builder: (context, params) => const SuccessPageCopyWidget(),
        ),
        FFRoute(
          name: 'Homepage_Auditivo',
          path: '/homepageAuditivo',
          builder: (context, params) => const HomepageAuditivoWidget(),
        ),
        FFRoute(
          name: 'success_kinest',
          path: '/successKinest',
          builder: (context, params) => const SuccessKinestWidget(),
        ),
        FFRoute(
          name: 'chat_ai_ScreenCopy',
          path: '/chatAiScreenCopy',
          builder: (context, params) => const ChatAiScreenCopyWidget(),
        ),
        FFRoute(
          name: 'Homepage_kinestesicoCopy',
          path: '/homepageKinestesicoCopy',
          builder: (context, params) => const HomepageKinestesicoCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
