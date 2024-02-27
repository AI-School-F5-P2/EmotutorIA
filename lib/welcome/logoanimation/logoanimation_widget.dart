import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'logoanimation_model.dart';
export 'logoanimation_model.dart';

class LogoanimationWidget extends StatefulWidget {
  const LogoanimationWidget({super.key});

  @override
  State<LogoanimationWidget> createState() => _LogoanimationWidgetState();
}

class _LogoanimationWidgetState extends State<LogoanimationWidget> {
  late LogoanimationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoanimationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => _model.lottieAnimationStatus = false);

      context.pushNamed('Welcome');
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Wrap(
        spacing: 0.0,
        runSpacing: 0.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.down,
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Lottie.asset(
              'assets/lottie_animations/Start.json',
              width: 420.0,
              height: 801.0,
              fit: BoxFit.fill,
              reverse: true,
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
}
