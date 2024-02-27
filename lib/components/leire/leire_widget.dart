import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'leire_model.dart';
export 'leire_model.dart';

class LeireWidget extends StatefulWidget {
  const LeireWidget({super.key});

  @override
  State<LeireWidget> createState() => _LeireWidgetState();
}

class _LeireWidgetState extends State<LeireWidget> {
  late LeireModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeireModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/robot_2.png',
            width: 300.0,
            height: 302.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
