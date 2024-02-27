import '/components/cardvisual1/cardvisual1_widget.dart';
import '/components/cardvisual2/cardvisual2_widget.dart';
import '/components/chat_tutor/chat_tutor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_visual_widget.dart' show HomepageVisualWidget;
import 'package:flutter/material.dart';

class HomepageVisualModel extends FlutterFlowModel<HomepageVisualWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardvisual1 component.
  late Cardvisual1Model cardvisual1Model;
  // Model for cardvisual2 component.
  late Cardvisual2Model cardvisual2Model;
  // Model for ChatTutor component.
  late ChatTutorModel chatTutorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardvisual1Model = createModel(context, () => Cardvisual1Model());
    cardvisual2Model = createModel(context, () => Cardvisual2Model());
    chatTutorModel = createModel(context, () => ChatTutorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardvisual1Model.dispose();
    cardvisual2Model.dispose();
    chatTutorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
