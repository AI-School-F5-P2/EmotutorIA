import '/components/leire/leire_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_leire_widget.dart' show ChatbotLeireWidget;
import 'package:flutter/material.dart';

class ChatbotLeireModel extends FlutterFlowModel<ChatbotLeireWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for leire component.
  late LeireModel leireModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    leireModel = createModel(context, () => LeireModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    leireModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
