import '/components/cardlector/cardlector_widget.dart';
import '/components/chat_tutor/chat_tutor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_lector_widget.dart' show HomepageLectorWidget;
import 'package:flutter/material.dart';

class HomepageLectorModel extends FlutterFlowModel<HomepageLectorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardlector component.
  late CardlectorModel cardlectorModel;
  // Model for ChatTutor component.
  late ChatTutorModel chatTutorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardlectorModel = createModel(context, () => CardlectorModel());
    chatTutorModel = createModel(context, () => ChatTutorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardlectorModel.dispose();
    chatTutorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
