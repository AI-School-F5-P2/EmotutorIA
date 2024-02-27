import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'readingexercise1_widget.dart' show Readingexercise1Widget;
import 'package:flutter/material.dart';

class Readingexercise1Model extends FlutterFlowModel<Readingexercise1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RadioBincorrect1 widget.
  FormFieldController<String>? radioBincorrect1ValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioBincorrect1Value => radioBincorrect1ValueController?.value;
}
