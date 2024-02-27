import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blank_list_component_copy_model.dart';
export 'blank_list_component_copy_model.dart';

class BlankListComponentCopyWidget extends StatefulWidget {
  const BlankListComponentCopyWidget({super.key});

  @override
  State<BlankListComponentCopyWidget> createState() =>
      _BlankListComponentCopyWidgetState();
}

class _BlankListComponentCopyWidgetState
    extends State<BlankListComponentCopyWidget> {
  late BlankListComponentCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankListComponentCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: () {
                if (MediaQuery.sizeOf(context).width >= 1170.0) {
                  return 700.0;
                } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                  return 330.0;
                } else {
                  return 530.0;
                }
              }(),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF5B75F3),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 1.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectionArea(
                      child: AutoSizeText(
                    FFLocalizations.of(context).getText(
                      '49l4ef03' /* ¡Hola, soy Leire tu tutora de ... */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.5,
                        ),
                  )),
                ]
                    .addToStart(const SizedBox(height: 12.0))
                    .addToEnd(const SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
