import '/components/card_audi01/card_audi01_widget.dart';
import '/components/card_audi02/card_audi02_widget.dart';
import '/components/chat_tutor/chat_tutor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_auditivo_widget.dart' show HomepageAuditivoWidget;
import 'package:flutter/material.dart';

class HomepageAuditivoModel extends FlutterFlowModel<HomepageAuditivoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cardAudi01 component.
  late CardAudi01Model cardAudi01Model;
  // Model for cardAudi02 component.
  late CardAudi02Model cardAudi02Model;
  // Model for ChatTutor component.
  late ChatTutorModel chatTutorModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardAudi01Model = createModel(context, () => CardAudi01Model());
    cardAudi02Model = createModel(context, () => CardAudi02Model());
    chatTutorModel = createModel(context, () => ChatTutorModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardAudi01Model.dispose();
    cardAudi02Model.dispose();
    chatTutorModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
