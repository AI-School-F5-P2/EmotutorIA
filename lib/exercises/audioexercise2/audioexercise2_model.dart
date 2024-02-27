import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'audioexercise2_widget.dart' show Audioexercise2Widget;
import 'package:flutter/material.dart';

class Audioexercise2Model extends FlutterFlowModel<Audioexercise2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RadioBcorrect widget.
  FormFieldController<String>? radioBcorrectValueController;
  // State field(s) for RadioBincorrect1 widget.
  FormFieldController<String>? radioBincorrect1ValueController;
  // State field(s) for RadioBincorrect2 widget.
  FormFieldController<String>? radioBincorrect2ValueController;
  // State field(s) for RadioBincorrect3 widget.
  FormFieldController<String>? radioBincorrect3ValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioBcorrectValue => radioBcorrectValueController?.value;
  String? get radioBincorrect1Value => radioBincorrect1ValueController?.value;
  String? get radioBincorrect2Value => radioBincorrect2ValueController?.value;
  String? get radioBincorrect3Value => radioBincorrect3ValueController?.value;
}
