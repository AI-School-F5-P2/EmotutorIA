import '/components/cardkines/cardkines_widget.dart';
import '/components/chat_tutor/chat_tutor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_kinestesico_widget.dart' show HomepageKinestesicoWidget;
import 'package:flutter/material.dart';

class HomepageKinestesicoModel
    extends FlutterFlowModel<HomepageKinestesicoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardkines component.
  late CardkinesModel cardkinesModel;
  // Model for ChatTutor component.
  late ChatTutorModel chatTutorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardkinesModel = createModel(context, () => CardkinesModel());
    chatTutorModel = createModel(context, () => ChatTutorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardkinesModel.dispose();
    chatTutorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
