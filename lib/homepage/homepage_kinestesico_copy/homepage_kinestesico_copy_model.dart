import '/components/cardkines_copy/cardkines_copy_widget.dart';
import '/components/chat_tutor/chat_tutor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_kinestesico_copy_widget.dart'
    show HomepageKinestesicoCopyWidget;
import 'package:flutter/material.dart';

class HomepageKinestesicoCopyModel
    extends FlutterFlowModel<HomepageKinestesicoCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardkinesCopy component.
  late CardkinesCopyModel cardkinesCopyModel;
  // Model for ChatTutor component.
  late ChatTutorModel chatTutorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardkinesCopyModel = createModel(context, () => CardkinesCopyModel());
    chatTutorModel = createModel(context, () => ChatTutorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardkinesCopyModel.dispose();
    chatTutorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
